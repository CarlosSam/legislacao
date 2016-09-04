class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :vote, :do_vote, :link_politicians]
  before_action :authenticate_user!, except: [:welcome, :index, :show]
  before_action :authenticate_admin!, only: [:edit, :update, :destroy, :link_politicians]

  def welcome
    render :welcome
  end

  def link_politicians
    render :link_politicians
  end

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.sort_by{|p| -p.netvotes}
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    thumbs_up = Vote.get_positive_votes(@project)
    thumbs_donw = Vote.get_negative_votes(@project)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  def do_vote
    Vote.vote(@project, current_user, (params[:outcome].eql?("true") ? true : false))
    render :show
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Projeto criado com sucesso.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :city, :state, :recipient, :wants, :doing, :impacts, :strategy, :explore, :define, :causes, :prototype)
    end
end
