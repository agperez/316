class SetlistsController < ApplicationController
  before_action :signed_in_user
  before_action :setlists_by_date, only: [:index, :archive]
  before_action :set_setlist, only: [:show, :edit, :update, :destroy]
  before_action :admin_user,  only: [:new, :create, :destroy]


  # GET /setlists
  # GET /setlists.json
  def index
    @setlist = @setlists.last
    @songs = @setlist.songs
  end

  def archive
  end

  # GET /setlists/1
  # GET /setlists/1.json
  def show
    @songs     = Song.select("id, name").order('name ASC')
    @set_songs = @setlist.setlist_songs.order('setlist_songs.position ASC')
  end

  # GET /setlists/new
  def new
    @setlist = Setlist.new
  end

  # GET /setlists/1/edit
  def edit
  end

  # POST /setlists
  # POST /setlists.json
  def create
    @setlist = Setlist.new(setlist_params)

    respond_to do |format|
      if @setlist.save
        format.html { redirect_to @setlist, notice: 'Setlist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @setlist }
      else
        format.html { render action: 'new' }
        format.json { render json: @setlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /setlists/1
  # PATCH/PUT /setlists/1.json
  def update
    respond_to do |format|
      if @setlist.update(setlist_params)
        format.html { redirect_to @setlist, notice: 'Setlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @setlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setlists/1
  # DELETE /setlists/1.json
  def destroy
    @setlist.destroy
    respond_to do |format|
      format.html { redirect_to setlists_url }
      format.json { head :no_content }
    end
  end

  private

    def setlists_by_date
      @setlists = Setlist.order(:date)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_setlist
      @setlist = Setlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setlist_params
      params.require(:setlist).permit(:date)
    end
end
