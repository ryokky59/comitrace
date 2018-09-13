class SchedulesController < ApplicationController
  def top
  end

  def index
  end

  def new
  end

  def create
    
  end

  def confirm
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :content, schedule_prans_attributes: [:plan, :start_time, :end_time])
  end



end
