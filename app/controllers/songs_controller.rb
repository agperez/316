class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]
  before_action :admin_user,  only: [:new, :create, :edit, :destroy, :update]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song }
        format.json { render action: 'show', status: :created, location: @song }
        flash[:success] = "Song successfully created"
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
    chartregex(@song)
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song }
        format.json { head :no_content }
        flash[:success] = "Song successfully updated"
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  def chartregex(song)
      splitlyrics = @song.chart.split("\r")
      chords = []
      chordregex = /([A-G][b\#]?(2|5|6|7|9|11|13|6\/9|7\-5|7\-9|7\#5|7\#9|7\+5|7\+9|7b5|7b9|7sus2|7sus4|add2|add4|add9|aug|dim|dim7|m\/maj7|m6|m7|m7b5|m9|m11|m13|maj7|maj9|maj11|maj13|mb5|m|sus|sus2|sus4|)*(\-)*)/
      splitlyrics.each_with_index do |index|
        if chordregex.match(index)
          chords.push(index)
          splitlyrics.delete(index)
        end
      end
    @song.lyrics = splitlyrics.join
    @song.chart_alt = chords.join
    @song.save
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :key, :chart, :chart_alt, :lyrics)
    end
end
