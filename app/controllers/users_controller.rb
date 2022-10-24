class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @post_images = @user(上で特定したuser)の関連付けられた投稿を全て取得
    # post_imegesはmodel/user.rbで定義したpost_imeges?質問
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
    
  end
end
