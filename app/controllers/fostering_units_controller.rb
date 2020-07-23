require 'date'
include ActionController::MimeResponds
class FosteringUnitsController < ApplicationController
  before_action :set_fostering_unit, only: :show

  # post /uf/yyyy-mm-dd.json
  def show
    if @fostering_unit.present?
      #Registro de consulta cliente
      Client.create(name: request.headers["x-CLIENTE"], date: Date.today)
      #Respuesta
      respond_to do |format|
        format.json { render(json: @fostering_unit.price ) }
      end
    else
      #respuesta con error
      respond_to do |format|
        format.json { render(json: "No Existe Fecha" ) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fostering_unit
      @fostering_unit = FosteringUnit.find_by_date(params[:date])
    end

    # Only allow a trusted parameter "white list" through.
    def fostering_unit_params
      params.require(:fostering_unit).permit(:date, :price)
    end
end
