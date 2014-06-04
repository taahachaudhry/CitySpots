class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @spot = Spot.find(params[:spot_id])
    @spot.comments.create(comment_params.merge(:user=>current_user))
    redirect_to places_path(@spot)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
