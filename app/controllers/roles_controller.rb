class RolesController < ApplicationController
  before_action :set_role,        only: [:show, :edit, :update, :destroy]
  before_action :set_calendar,    only: [:calendar2, :calendarAll]
  before_action :signed_in_user,  only: [:index, :show, :new, :calendar2, :edit, :create, :update, :destroy]
  before_action :admin_user,      only: [:index, :show, :new, :calendar2, :edit, :create, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
      format.js { render :json => @role.to_json }
    end
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  def calendar2
  end

  def calendarAll
  end


  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html {
          redirect_to dashboard_path
          flash[:success] = @role.name+' was successfully created.' }
        format.json { render json: @role.to_json }
      else
        format.html { render action: 'new' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html {
          redirect_to dashboard_path
          flash[:success] = @role.name+' was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, :color, :order, :text_color)
    end

    def set_calendar
      @teams = Team.order(:name)
      @users = User.order(:name)
      @roles = Role.order(:order) 
    end
end
