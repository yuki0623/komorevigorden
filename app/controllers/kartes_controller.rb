class KartesController < ApplicationController

  def index

  end


  def new
    @karte = Karte.new
  end

  def create
    @karte = Karte.new(karte_params)
    if @karte.save
      redirect_to messages_index_path
    else
      render :new
    end
  end

  def toppage
  end



  private

  def karte_params
    params.require(:karte).permit(:nickname, :gender_identities, :birthday, :age, :from, :consultation_content, :hearing1, :hearing2, :hearing3, :hearing4, :remarks).merge(gests_id: current_gest.id)
  end
end

