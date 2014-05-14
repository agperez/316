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
    @users = User.order(:name)
    @teams = Team.all
    @roles = Role.all
    @filters = Array.new
    first_letters
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

    def first_letters
      previous_letter = ""
      @users.each do |user|
        letter = user.name[0].downcase
        unless letter == previous_letter
          @filters.push letter
        end
        previous_letter = letter
      end
    end
    
end
