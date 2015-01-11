class UsersController < ApplicationController
  before_action :signed_in_user, 	only: [:index, :edit, :update, :destroy, :profile,
                                         :picture, :us, :deactivated]
  before_action :admin_user, 		  only: [:index, :destroy, :import, :deactivated]
  before_action :correct_user, 		only: [:show, :edit, :update, :picture]
  before_action :not_signed_in,   only:  :new
  before_action :admin_user, 		  only: [:index, :destroy, :import, :deactivated]

  def new
  	@user = User.new
  end

  def import
    User.import(params[:file])
    redirect_to users_path, notice: "Users Updated."
  end

  def picture
  end


  def us
    @users = User.active.order(:first_name)
    @users2 = User.active.order(:last_name)
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
    role_ids = @user.events.where("event_date > ?", Time.now-50.days).pluck(:role_id)
    @roles = Role.where(:id => role_ids)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
      format.js { render :json => @user.to_json }
    end
  end

  def inactive
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Your account has been created!"
      redirect_to picture_user_path(@user)
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

  def editpersonal
  end

  def deactivated
    @deactivated_users = User.deactivated
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
  	if @user.update_attributes(user_params)
      if current_user.admin?
        if @user.deactivated?
          flash[:success] = @user.first_name + " has been deactivated"
          redirect_to dashboard_path
        else
          flash[:success] = @user.first_name + " has been updated"
  		    redirect_to profile_user_path(@user)
        end
  	  else
        flash[:success] = "Profile updated"
        redirect_to profile_user_path(@user)
      end
    else
      render 'edit'
    end
  end

  def destroy
  	User.find(params[:id]).destroy
  	flash[:success] = "User deleted."
  	redirect_to dashboard_path
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation, :reminders, :facebook,
                                   :team_id, :role_id, :worship_role_id, :gender,
                                   :birth_date, :phone, :address1, :city, :state,
                                   :zip, :twitter, :spouse, :photo_link, :avatar,
                                   :avatar_remote_url, :avatar_url, :deactivated,
                                   :hide_email, :hide_phone, :hide_address,
                                    events_attributes: [:user_id, :role_id])
  	end

  	def signed_in_user
  		unless signed_in?
  			store_location
  			redirect_to signin_url
        flash[:error] = "Please sign in to view this page."
  		end
  	end

    def not_signed_in
      if signed_in?
        unless current_user.admin?
          redirect_to(current_user)
        end
      end
    end

  	def correct_user
  		@user = User.find(params[:id])
      redirect_to(current_user) unless current_user?(@user) || current_user.admin?
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
