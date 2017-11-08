class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation
  before_action :set_message, only: [:show, :edit, :update, :destroy] 

  def index
    @messages = @conversation.messages # Retrive all messages belonging to current conversation
    @message = Message.new # Bring up form for new message
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_messages_url(@conversation), notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
    authorize @message
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
    
  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
