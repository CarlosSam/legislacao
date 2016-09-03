class Adm::PoliticiansController < ApplicationController
  before_action :set_adm_politician, only: [:show, :edit, :update, :destroy]

  # GET /adm/politicians
  # GET /adm/politicians.json
  def index
    @adm_politicians = Adm::Politician.all
  end

  # GET /adm/politicians/1
  # GET /adm/politicians/1.json
  def show
  end

  # GET /adm/politicians/new
  def new
    @adm_politician = Adm::Politician.new
  end

  # GET /adm/politicians/1/edit
  def edit
  end

  # POST /adm/politicians
  # POST /adm/politicians.json
  def create
    @adm_politician = Adm::Politician.new(adm_politician_params)

    respond_to do |format|
      if @adm_politician.save
        format.html { redirect_to @adm_politician, notice: 'Politician was successfully created.' }
        format.json { render :show, status: :created, location: @adm_politician }
      else
        format.html { render :new }
        format.json { render json: @adm_politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adm/politicians/1
  # PATCH/PUT /adm/politicians/1.json
  def update
    respond_to do |format|
      if @adm_politician.update(adm_politician_params)
        format.html { redirect_to @adm_politician, notice: 'Politician was successfully updated.' }
        format.json { render :show, status: :ok, location: @adm_politician }
      else
        format.html { render :edit }
        format.json { render json: @adm_politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adm/politicians/1
  # DELETE /adm/politicians/1.json
  def destroy
    @adm_politician.destroy
    respond_to do |format|
      format.html { redirect_to adm_politicians_url, notice: 'Politician was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adm_politician
      @adm_politician = Adm::Politician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adm_politician_params
      params.require(:adm_politician).permit(:name, :number, :party, :email)
    end
end
