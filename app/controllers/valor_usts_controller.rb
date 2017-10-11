class ValorUstsController < ApplicationController
  before_action :set_valor_ust, only: [:show, :edit, :update, :destroy]

  # GET /valor_usts
  # GET /valor_usts.json
  def index
    @valor_usts = ValorUst.all
  end

  # GET /valor_usts/1
  # GET /valor_usts/1.json
  def show
  end

  # GET /valor_usts/new
  def new
    @valor_ust = ValorUst.new
  end

  # GET /valor_usts/1/edit
  def edit
  end

  # POST /valor_usts
  # POST /valor_usts.json
  def create
    @valor_ust = ValorUst.new(valor_ust_params)

    respond_to do |format|
      if @valor_ust.save
        format.html { redirect_to @valor_ust, notice: 'Valor ust was successfully created.' }
        format.json { render :show, status: :created, location: @valor_ust }
      else
        format.html { render :new }
        format.json { render json: @valor_ust.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valor_usts/1
  # PATCH/PUT /valor_usts/1.json
  def update
    respond_to do |format|
      if @valor_ust.update(valor_ust_params)
        format.html { redirect_to @valor_ust, notice: 'Valor ust was successfully updated.' }
        format.json { render :show, status: :ok, location: @valor_ust }
      else
        format.html { render :edit }
        format.json { render json: @valor_ust.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valor_usts/1
  # DELETE /valor_usts/1.json
  def destroy
    @valor_ust.destroy
    respond_to do |format|
      format.html { redirect_to valor_usts_url, notice: 'Valor ust was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valor_ust
      @valor_ust = ValorUst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valor_ust_params
      params.require(:valor_ust).permit(:valor, :inicioVigencia, :fimVigencia)
    end
end
