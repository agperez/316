class SermonsController < ApplicationController
  before_action :set_sermon,      only: [:show, :edit, :update, :destroy]
  before_action :all_sermons,     only: [:manage]
  before_action :signed_in_user,  only: [:manage, :new, :create, :edit, :update, :destroy]
  before_action :admin_user,      only: [:manage, :new, :create, :edit, :update, :destroy]


  def index
  end

  def archive
    if params[:book]
      @ordered_sermons = Sermon.text_search(params[:book]).ordered(params)
    elsif params[:tags]
      @ordered_sermons = Sermon.search_by_tag(params[:tags]).ordered(params)
    else
      @ordered_sermons = Sermon.all.ordered(params)
    end
  end


  def manage
  end

  def show
  end

  def new
    @sermon = Sermon.new
  end

  def edit
  end

  def create
    @sermon = Sermon.new(sermon_params)

    respond_to do |format|
      if @sermon.save
      format.html { redirect_to @sermon }
      format.json { render action: 'show' }
      flash[:success] = "Sermon successfully created"

      else
      format.html { render action: 'new' }
      format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sermon.update(sermon_params)
        format.html { redirect_to @sermon }
        format.json { head :no_content }
        flash[:success] = "Sermon successfully updated"
      else
        format.html { render action: 'edit' }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sermon.destroy
    respond_to do |format|
      format.html { redirect_to sermons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sermon
      @sermon = Sermon.find(params[:id])
    end


    def all_sermons
      @sermons = Sermon.all_sermons
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sermon_params
      params.require(:sermon).permit(:book, :chapter, :chapter_last, :verse_first,
                                     :verse_last, :video, :audio, :speaker, :s_date,
                                     :outline, :link, :announcements, :published, :tags)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in to view this page."
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
