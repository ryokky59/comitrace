class CommentsController < ApplicationController
  def create
    @schedule = Schedule.find(params[:schedule_id])
    @comment = @schedule.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to schedule_path(@schedule) }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:schedule_id, :comment)
  end
end
