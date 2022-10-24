class UsersController < ApplicationController
  def show
    @user = PostImage.find(params[:id])
    @post_images = @User.post_images
  end

  def edit
  end
end
