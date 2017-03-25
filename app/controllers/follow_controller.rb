class FollowController < ApplicationController

  def follow
    target = User.find(params[:user_id])
    active_relationships = current_user.active_relationships.build(target_id: target.id)
    active_relationships.save
    redirect_to target
  end
  
  def unfollow
    target = User.find(params[:user_id])
    active_relationships = current_user.active_relationships.find_by(target_id: target.id)
    active_relationships.destroy
    redirect_to target
  end

end
