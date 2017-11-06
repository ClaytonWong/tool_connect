class RentalsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Get the rentals that the logged in user has made
    @rentals = Rental.find_by(tool_id: @tool.id)
  end
  
  def show
  end
  
  def new
    # New rental for our form
    @rental = Rental.new
    # The tool_id come from the URL (bit after the ?)
    @rental.tool = Tool.find(params[:tool_id])
  end
  
  def create
    rental_params = params.require(:rental).permit(:tool_id, :hirer_id, :charge_identifier, :start_of_hire, :end_of_hire)
    
    # New rental to save to database
    @rental = Rental.new
    # The tool_id comes from the form (hidden_tag :tool_id)
    @rental.tool = Tool.find(rental_params[:tool_id])
    @rental.hirer = current_user
      
    # Amount in cents
    @amount = @rental.tool.cost_of_hire_cents
    
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )
    
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @rental.tool.name,
      :currency    => 'aud'
    )
  
    @rental.charge_identifier = charge.id
    @rental.save
    redirect_to rentals_path
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_rental_path(tool_id: @rental.tool.id)
  end
end
