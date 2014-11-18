class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order('created_at desc').
        includes(:owner, trackable: {recipe: :user})
  end

  def friend
    redirect_to(:login_url, alert:'Log in first.') unless current_user
    @activities = PublicActivity::Activity.order('created_at desc').
        where(owner:current_user.friends).
        includes(:owner, trackable: {recipe: :user})
    render 'index'
  end
end
