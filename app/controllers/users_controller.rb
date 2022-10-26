class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @post_images = @user(上で特定したuser)の関連付けられた投稿を全て取得
    # post_imegesはmodel/user.rbで定義したpost_imeges?質問
 # ページネーション仕様に書き換えpage(params[:id])はkaminariをインストールしたことで使用可能に
    @post_images = @user.post_images.page(params[:page])
    # @post_images = @user.post_images
  end

  def edit
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to post_imeges_path
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image)
  end
end
