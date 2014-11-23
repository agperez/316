class WorshipRolesController < ApplicationController
  before_action :set_worship_role, only: [:show, :edit, :update, :destroy]

  def index
    @worship_roles = WorshipRole.all
  end

  def show
  end
  
  def new
    @worsip_role = WorshipRole.new
  end

  def edit
  end

  def create
    @worship_role = WorshipRole.new(worship_role_params)

    respond_to do |format|
      if @worship_role.save
        format.html { redirect_to @worship_role, notice: 'Worship Role was successfully created.' }
        format.json { render json: @worship_role.to_json }
      else
        format.html { render action: 'new' }
        format.json { render json: @worship_role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @worship_role.update(worship_role_params)
        format.html { redirect_to @worship_role, notice: 'Worship Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @worship_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @worship_role.destroy
    respond_to do |format|
      format.html { redirect_to worship_roles_url }
      format.json { head :no_content }
    end
  end


  private

    def worship_role_params
      params.require(:worship_role).permit(:name)
    end

    def set_worship_role
      @worship_role = WorshipRole.find(params[:id])
    end
end
