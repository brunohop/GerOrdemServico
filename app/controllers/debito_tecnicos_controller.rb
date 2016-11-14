class DebitoTecnicosController < ApplicationController
  before_action :set_debito_tecnico, only: [:show, :edit, :update, :destroy]

  # GET /debito_tecnicos
  # GET /debito_tecnicos.json
  def index
    @debito_tecnicos = DebitoTecnico.all
  end

  # GET /debito_tecnicos/1
  # GET /debito_tecnicos/1.json
  def show
  end

  # GET /debito_tecnicos/new
  def new
    @debito_tecnico = DebitoTecnico.new
  end

  # GET /debito_tecnicos/1/edit
  def edit
  end

  # POST /debito_tecnicos
  # POST /debito_tecnicos.json
  def create
    @debito_tecnico = DebitoTecnico.new(debito_tecnico_params)

    respond_to do |format|
      if @debito_tecnico.save
        format.html { redirect_to @debito_tecnico, notice: 'Debito tecnico was successfully created.' }
        format.json { render :show, status: :created, location: @debito_tecnico }
      else
        format.html { render :new }
        format.json { render json: @debito_tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debito_tecnicos/1
  # PATCH/PUT /debito_tecnicos/1.json
  def update
    respond_to do |format|
      if @debito_tecnico.update(debito_tecnico_params)
        format.html { redirect_to @debito_tecnico, notice: 'Debito tecnico was successfully updated.' }
        format.json { render :show, status: :ok, location: @debito_tecnico }
      else
        format.html { render :edit }
        format.json { render json: @debito_tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debito_tecnicos/1
  # DELETE /debito_tecnicos/1.json
  def destroy
    @debito_tecnico.destroy
    respond_to do |format|
      format.html { redirect_to debito_tecnicos_url, notice: 'Debito tecnico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debito_tecnico
      @debito_tecnico = DebitoTecnico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debito_tecnico_params
      params.require(:debito_tecnico).permit(:debito_tecnico)
    end
end
