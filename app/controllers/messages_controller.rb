class MessagesController < ApplicationController
  before_action :set_karte

  def index
    @message = Message.new
    @gests = Gest.all
  end

  def create
    @karte = Karte.find(params[:karte_id])
    if host_signed_in?
        @message = Message.new(message_params_host)
      elsif cast_signed_in?
        @message = Message.new(message_params_cast)
      else gest_signed_in?
        @message = Message.new(message_params_gest)
    end
    if @message.save
      respond_to do |format|
        format.html { redirect_to karte_path(@karte), notice: 'メッセージが送信されました' }
        format.json
      end
    else
      render @karte
    end
    #   @messages = @gest.messages.includes(:user)
    #   flash.now[:alert] = 'メッセージを入力してください。'
    #   render root_path
    # end
  end

  private

  def message_params_host
    params.require(:message).permit(:name, :content, :image).merge(host_id: current_host.id, karte_id: params[:karte_id])
  end

  def message_params_cast
    params.require(:message).permit(:name, :content, :image).merge(cast_id: current_cast.id, karte_id: params[:karte_id])
  end

  def message_params_gest
    params.require(:message).permit(:name, :content, :image).merge(gest_id: current_gest.id, karte_id: params[:karte_id])
  end

  def set_karte
    @karte = Karte.find(params[:karte_id])
  end

  # def set_group
  #   @groups = Groups.find(params[:gests_id, :casts_id, :host_id])
  # end
end