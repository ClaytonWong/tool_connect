class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  
  # GET /conversations
  # GET /conversations.json
  def index
    # Retrive conversations where the hirer is the current user
    hc = Conversation.where(hirer: current_user)
    # Get conversations where the owner is the current user
    oc = Conversation.where(owner: current_user)
    # Get conversations that involve current user        
    @conversations = hc|oc
  end
  
  # GET /conversations/1
  # GET /conversations/1.json
  def show
    redirect_to conversation_messages_path(@conversation)
  end
  
  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end
  
  # GET /conversations/1/edit
  def edit
  end
  
  # POST /conversations
  # POST /conversations.json
  def create
    # Find existing conversations involving current user & owner of current tool
    hc = Conversation.where(hirer_id: current_user) 
    oc = Conversation.where(owner_id: params[:conversation][:owner_id])
    @con_inter = hc & oc
    
    if (@con_inter.empty? == false)
        # If conversations involving current user and owner of current tool exist,
        # then go to the first one
        @conversation = @con_inter.first
    else
        # Create a new conversation
        @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)    
  end
  
  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_conversation
    @conversation = Conversation.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def conversation_params
    params.require(:conversation).permit(:owner_id, :hirer_id)
  end
end
