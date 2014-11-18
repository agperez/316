class SetlistSongsController < ApplicationController
  before_action :set_setlist_song, only: [:update, :destroy]

  def index
    @setlist_songs = SetlistSong.where(setlist_id: 2).order('setlist_songs.position ASC')
  end

  def sort
    @setlist_songs = SetlistSong.all
    @setlist_songs.each do |setlist_song|
      song_index = params['setlist_song'].index(setlist_song.id.to_s)
      unless song_index.nil?
        setlist_song.position = song_index + 1
        setlist_song.save
      end
    end
    render :nothing => true
  end

  def show
  end

  def new
    @setlist_song = SetlistSong.new
  end

  def edit
  end

  def create
    @setlist_song = SetlistSong.new(setlist_song_params)

    respond_to do |format|
      if @setlist_song.save
        format.html { redirect_to @setlist_song, notice: 'Setlist song was successfully created.' }
        format.json { render json: @setlist_song.to_json }
      else
        format.html { render :new }
        format.json { render json: @setlist_song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @setlist_song.update(setlist_song_params)
        format.html { redirect_to @setlist_song, notice: 'Setlist song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @setlist_song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @setlist_song.destroy
    respond_to do |format|
      format.html { redirect_to setlist_songs_url, notice: 'Setlist song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_setlist_song
      @setlist_song = SetlistSong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setlist_song_params
      params.require(:setlist_song).permit(:song_id, :setlist_id, :altkey)
    end
end
