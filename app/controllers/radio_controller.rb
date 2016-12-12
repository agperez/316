class RadioController < ApplicationController
  before_action :medium, only: [ :show, :edit, :update, :destroy ]

  def index
    @media = Medium::Radio.ordered(params)
  end

  def create
    @medium = Medium::Radio.new(medium_radio_params)
    if @medium.save
      render :show
      flash[:success] = "Radio successfully created"
    else
      flash[:success] = @medium.errors.full_messages
      redirect_to new_radio_path
    end
  end

  def update
    if medium.update_attributes(medium_radio_params)
      render :show
      flash[:success] = "Radio successfully updated"
    else
      flash[:success] = @medium.errors.full_messages
      redirect_to edit_radio_path(@medium)
    end
  end

  def destroy
    if medium.delete
      redirect_to radio_index_path
      flash[:success] = "Radio successfully deleted"
    else
      flash[:success] = @medium.errors.full_messages
      redirect_to radio_path(@medium)
    end
  end

  private

  def medium
    @medium ||= Medium::Radio.friendly.find params[:id]
  end

  def medium_radio_params
    params[:medium_radio].permit(:s_date, :outline, :title, :audio, :episode_number)
  end


end
