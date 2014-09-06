class UsersController < ApplicationController
  before_action :signed_in_user, 	only: [:index, :edit, :update, :destroy, :profile]
  before_action :correct_user, 		only: [:show, :edit, :update]
  before_action :not_signed_in,   only: [:new]

  # prevent anyone except admins from using the delete method
  before_action :admin_user, 		  only: [:index, :destroy, :import]

  def new
  	@user = User.new
  end

  def import
    User.import(params[:file])
    redirect_to users_path, notice: "Users Updated."
  end

  def us
    @users = User.order(:first_name)
    @users2 = User.order(:last_name)
    @filters = Array.new
    @last_filters = Array.new
    first_letters
    first_letters_last
  end

  def profile
    @user = User.find(params[:id])
  end

  def show
    @current_user = current_user
  	@user = User.find(params[:id])
    @future_events = @user.events.where("event_date > ?", Time.now).order("event_date ASC")
    @user_roles = @future_events.map {|a| a.role_id}.uniq
    @roles = Array.new
    @user_roles.each do |id|
      @roles << Role.find(id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
      format.js { render :json => @user.to_json }
    end
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      flash[:success] = "Account for "+@user.first_name+" created."
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  # Utilizes the will_paginate gem (and the bootstrap-will_paginate gem) to create multiple pages.
  def index
  	@users = User.paginate(page: params[:page])
    @export = User.all
    respond_to do |format|
      format.html
      format.csv { render text: @export.to_csv }
    end
  end

  def edit
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
  	if @user.update_attributes(user_params)
      if current_user.admin?
        flash[:success] = @user.first_name + " has been updated"
		    redirect_to dashboard_path
  	  else
        flash[:success] = "Profile updated"
        redirect_to @user
      end
    else
      redirect_to dashboard_path
    end
  end

  def destroy
  	User.find(params[:id]).destroy
  	flash[:success] = "User deleted."
  	redirect_to dashboard_path
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                   :reminders, :facebook, :team_id, :role_id, :gender, :birth_date,
                                   :phone, :address1, :address2, :twitter, :spouse, :photo_link,
                                   :avatar, :avatar_remote_url, :avatar_url,
                                    events_attributes: [:user_id, :role_id])
  	end

  	# Checks if a user is signed in when they attempt to view a particular page.
  	# If not, it stores the location of the page they were attempting to visit and redirects
  	#   to the sign-in page.
  	def signed_in_user
  		unless signed_in?
  			store_location
  			redirect_to signin_url
        flash[:error] = "Please sign in to view this page."
  		end
  	end

    # Checks if the user is already signed-up
    def not_signed_in
      if signed_in?
        unless current_user.admin?
          redirect_to(current_user)
        end
      end
    end

  	# Checks if the user is the same as the user for who's action they are trying to access.
  	def correct_user
  		@user = User.find(params[:id])
      redirect_to(current_user) unless current_user?(@user) || current_user.admin?
  	end

  	# Checks if the user's admin-boolean = true.
  	def admin_user
  		redirect_to(root_url) unless current_user.admin?
  	end

    def first_letters
      previous_letter = ""
      @users.each do |user|
        letter = user.first_name[0].downcase
        unless letter == previous_letter
          @filters.push letter
        end
        previous_letter = letter
      end
    end

    def first_letters_last
      previous_letter = ""
      @users2.each do |user|
        letter = user.last_name[0].downcase
        unless letter == previous_letter
          @last_filters.push letter
        end
        previous_letter = letter
      end
    end
end
