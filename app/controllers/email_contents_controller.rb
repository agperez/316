class EmailContentsController < ApplicationController
  before_action :set_email_content, only: [:show, :edit, :update, :destroy]

  # GET /email_contents
  # GET /email_contents.json
  def index
    @email_contents = EmailContent.all
  end

  # GET /email_contents/1
  # GET /email_contents/1.json
  def show
  end

  # GET /email_contents/new
  def new
    @email_content = EmailContent.new
  end

  # GET /email_contents/1/edit
  def edit
  end

  # POST /email_contents
  # POST /email_contents.json
  def create
    @email_content = EmailContent.new(email_content_params)
      if @email_content.save
        if @email_content.origin == "contactemail"
          contact_email
        elsif @email_content.origin == "returnemail"
          return_email
        else
          prayer_email
        end
      else
        flash[:error] = 'Your email has failed to send.'
        redirect_to dashboard_path
      end
  end

  # PATCH/PUT /email_contents/1
  # PATCH/PUT /email_contents/1.json
  def update
    respond_to do |format|
      if @email_content.update(email_content_params)
        format.html { redirect_to @email_content, notice: 'Email content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @email_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_contents/1
  # DELETE /email_contents/1.json
  def destroy
    @email_content.destroy
    respond_to do |format|
      format.html { redirect_to email_contents_url }
      format.json { head :no_content }
    end
  end

  def schedule_email
    @date1 = Time.now
    @date2 = @date1 + 1.years
    @users_with_events = User.joins(:events).where(events: {event_date: @date1..@date2})
    @users_with_events.uniq.each do |user|
      @eventsall = user.events.where(events: {event_date: @date1..@date2})
      ScheduleMailer.schedule_email(user, @eventsall).deliver
    end
      flash[:success] = 'Your email has been sent.'
      redirect_to dashboard_path
  end

  def return_email
    ReturnMailer.return_email(current_user).deliver
    flash[:success] = 'Your email has been sent.'
    redirect_to(current_user)
  end

  def contact_email
    ContactMailer.contact_email(current_user).deliver
    flash[:success] = 'Your email has been sent.'
    redirect_to(current_user)
  end

  def prayer_email
    PrayerMailer.prayer_email(current_user).deliver
    flash[:success] = 'Your email has been sent.'
    redirect_to(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_content
      @email_content = EmailContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_content_params
      params.require(:email_content).permit(:email, :text, :recipient, :origin)
    end
end
