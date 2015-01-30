class HighlightsController < ApplicationController
  before_action :find_highlight, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,  only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user,      only: [:new, :create, :edit, :update, :destroy]


  def index
    @highlights = Highlight.all.ordered(params)

  end


  def show

  end


  def new
    @highlight = Highlight.new
  end

  def create
    @highlight = Highlight.new strong_params

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to @highlight }
        format.json { render action: 'show' }
        flash[:success] = "Highlight successfully created"

      else
        format.html { render action: 'new' }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
        flash[:failure] = "Sorry, something went wrong"
      end
    end
  end


  def edit

  end


  def update
    @highlight.update_attributes strong_params

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to @highlight }
        format.json { render action: 'show' }
        flash[:success] = "Highlight successfully updated"

      else
        format.html { render action: 'edit' }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
        flash[:failure] = "Sorry, something went wrong"
      end
    end
  end

  def destroy
    if @highlight.delete
      redirect_to highlights_path
      flash[:success] = "Highlight successfully removed"
    else
      redirect_to :back
      flash[:failure] = "Sorry, something went wrong"
    end
  end

  private

  def find_highlight
    @highlight = Highlight.friendly.find params[:id]
  end

  def strong_params
    params[:highlight].permit(:title, :video, :audio, :created_at, :sermon_link)
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
