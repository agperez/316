class SermonsController < ApplicationController
  before_action :set_sermon, only: [:show, :edit, :update, :destroy]

  # GET /sermons
  # GET /sermons.json
  def index
    @sermons_recent = Sermon.order("s_date DESC").limit(5)
    # @sermons = Sermon.all
    @sermons = Sermon.all
  end

  # GET /sermons/1
  # GET /sermons/1.json
  def show
    @sermons_recent = Sermon.order("created_at DESC").limit(3)
  end

  # GET /sermons/new
  def new
    @sermon = Sermon.new
    @sermons_recent = Sermon.order("created_at DESC").limit(3)
  end

  # GET /sermons/1/edit
  def edit
    @sermons_recent = Sermon.order("created_at DESC").limit(3)
  end

  # POST /sermons
  # POST /sermons.json
  def create
    @sermon = Sermon.new(sermon_params)

    respond_to do |format|
      if @sermon.save
        format.html { redirect_to @sermon, notice: 'Sermon was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sermon }
      else
        format.html { render action: 'new' }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sermons/1
  # PATCH/PUT /sermons/1.json
  def update
    respond_to do |format|
      if @sermon.update(sermon_params)
        format.html { redirect_to @sermon, notice: 'Sermon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermons/1
  # DELETE /sermons/1.json
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def sermon_params
      params.require(:sermon).permit(:book, :chapter, :verse_first, :verse_last, :video, :audio, :speaker, :s_date, :outline)
    end
end
