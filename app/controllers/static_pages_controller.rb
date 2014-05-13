class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: :dashboard
  before_action :admin_user,    only: :dashboard
  
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def dashboard
    @users = User.all
    @teams = Team.all
    @roles = Role.all
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def datepicker
  end


  private

    

    # Checks if the user's admin-boolean = true.
    
end
