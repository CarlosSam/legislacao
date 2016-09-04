class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /adm/politicians
  # GET /adm/politicians.json
  def index
    @politicians = Politician.all
  end

  # GET /adm/politicians/1
  # GET /adm/politicians/1.json
  def show
  end

  # GET /adm/politicians/new
  def new
    @politician = Politician.new
  end

  # GET /adm/politicians/1/edit
  def edit
  end

  # POST /adm/politicians
  # POST /adm/politicians.json
  def create
    @politician = Politician.new(politician_params)

    respond_to do |format|
      if @politician.save
        format.html { redirect_to @politician, notice: 'Político criado com sucesso.' }
        format.json { render :show, status: :created, location: @politician }
      else
        format.html { render :new }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adm/politicians/1
  # PATCH/PUT /adm/politicians/1.json
  def update
    respond_to do |format|
      if @politician.update(politician_params)
        format.html { redirect_to @politician, notice: 'Político atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @politician }
      else
        format.html { render :edit }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adm/politicians/1
  # DELETE /adm/politicians/1.json
  def destroy
    @politician.destroy
    respond_to do |format|
      format.html { redirect_to politicians_url, notice: 'Político removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician
      @politician = Politician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def politician_params
      params.require(:politician).permit(:name, :number, :party, :email)
    end
end
