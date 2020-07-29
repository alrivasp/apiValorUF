class ClientsController < ApplicationController
  before_action :set_client, only: :show

  # GET /client/:name
  def show
    #mes a consultar
    monthActual = Time.now.strftime('%m')
    yearActual =  Time.now.strftime('%y')
    result = 0
    if monthActual.to_s == "01" or monthActual.to_s == "03" or monthActual.to_s == "05" or monthActual.to_s == "07" or
      monthActual.to_s == "08" or  monthActual.to_s == "10" or monthActual.to_s == "12"

      result = Client.where(:name => params[:name], :date => "20#{yearActual}-#{monthActual}-01".."20#{yearActual}-#{monthActual}-31")            

    elsif monthActual.to_s == "04" or monthActual.to_s == "06" or monthActual.to_s == "09" or  monthActual.to_s == "11"

      result = Client.where(:name => params[:name], :date => "20#{yearActual}-#{monthActual}-01".."20#{yearActual}-#{monthActual}-30")      
    else

      result = Client.where(:name => params[:name], :date => "20#{yearActual}-#{monthActual}-01".."20#{yearActual}-#{monthActual}-28")      
    end

    respond_to do |format|
      format.json { render(json: result.count ) }
      format.html { render html: result.count }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      #@client = Client.where(name: params[:name])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:name, :date)
    end
end
