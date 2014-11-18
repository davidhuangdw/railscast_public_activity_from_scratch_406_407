class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order('created_at desc').
        includes(:owner, comment: {recipe: :user}, recipe: :user)
  end

  def friend
    redirect_to(:login_url, alert:'Log in first.') unless current_user
    @activities = Activity.order('created_at desc').
        where(owner:current_user.friends).
        includes(:owner, comment: {recipe: :user})
    render 'index'
  end
end
