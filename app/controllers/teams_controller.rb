class TeamsController < ApplicationController
  before_action :set_team,        only: [:show, :edit, :update, :destroy, :assign_events]
  before_action :signed_in_user,  only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :admin_user,      only: [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  def calendar
    @teams = Team.all
    @users = User.all
  end


  def calendar2
    @teams = Team.all
    @users = User.all
  end

  def assign_events
    @team = Team.find(params[:id])
    @users = @team.users
  end


  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html {redirect_to dashboard_path}
      format.xml  { render :xml => @team }
      format.js { render :json => @team.to_json }
    end    
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { 
          redirect_to dashboard_path
          flash[:success] = @team.name+' was successfully created.' 
        }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html {
          redirect_to dashboard_path
          flash[:success] = @team.name+' was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :color, events_attributes: [:event_date, :user_id, :role_id])
    end
end
