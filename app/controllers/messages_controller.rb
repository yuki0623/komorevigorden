class MessagesController < ApplicationController
  # before_action :set_group

  def index
    @message = Message.new
    @gests = Gest.all
    # @messages= @gest.messages.includes(:gest)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to gest_messages_path(@gest), notice: 'メッセージが送信されました' }
        format.json
      end
    else
      @messages = @gest.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(host_id: current_host.id, cast_id: current_cast.id, gest_id: current_gest.id)
  end

  # def set_group
  #   @groups = Groups.find(params[:gests_id, :casts_id, :host_id])
  # end
end