class PostCommentsController < ApplicationController

  def create
    # パラメータで指定された投稿画像を検索して、変数「post_image」へ格納する
    post_image = PostImage.find(params[:post_image_id])
    # 新しいコメントを生成して、変数「comment」へ格納する
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id　二行をまとめたものが下
    # 約　新しくコメントのインスタンスを作成、更にその作成者は現在ログインしているユーザーである
    comment = current_user.post_comments.new(post_comment_params)
    
    # 先ほど生成したコメントの投稿画像IDにパラメータで渡された投稿画像IDを設定する
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end