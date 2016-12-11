class RadioController < ApplicationController

  def index
    @media = Medium::Radio.all
  end

  def create
    
  end

  def new
    @medium = Medium::Radio.new
  end

  def edit

  end

  def update

  end

  def destroy

  end


end
