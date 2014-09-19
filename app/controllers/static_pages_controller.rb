class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: :dashboard
  before_action :admin_user,    only: :dashboard

  def email
    @date1 = Time.now
    @date2 = @date1 + 6.days
    @users_with_events = User.active.where(:reminders => true).joins(:events).where(:events => {:event_date => @date1..@date2})
    @user_names = @users_with_events.map {|user| user.first_name + ' ' + user.last_name}
    @users_with_events.each do |user|
      @next_event = user.events.where(:event_date => @date1..@date2).first
      UserMailer.reminder_email(user, @next_event).deliver
    end
    flash[:success] = "A reminder email has been sent to "+@user_names.to_sentence
    redirect_to dashboard_path
  end

  def dashboard
    @users = User.active.order(:first_name)
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
      @users.active.each do |user|
        letter = user.first_name[0].downcase
        unless letter == previous_letter
          @filters.push letter
        end
        previous_letter = letter
      end
    end

end
