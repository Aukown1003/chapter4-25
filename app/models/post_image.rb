class PostImage < ApplicationRecord
  has_one_attached :image
  
  # ここから
  # post_images = N 側に対して　User = 1がある
  # １側にも記述が必要
  belongs_to :user
  # 1のpost_imeagesが消された時nのpost_commentsも同時に消える
  has_many :post_comments, dependent: :destroy
  # ここまでがモデル同士の関係になる

  # モデルの中にdef endで定義をすることで特定の処理を名前で呼び出すことができる
  # 今回はget_imageを呼び出したときに実行する内容を記載
  # #get_imageはメソッド！
  # def get_image
  #   # imageがattached(添付)されていたか？
  #   if image.attached?
  #     image
  #   else
  #     # ないならno_imgを表示
  #     'no_image.jpg'
  #   end
  # end

# 上を更に改良
  def get_image
    # もしimageが添付されていなければno_image.jpgを呼び出す
    unless image.attached?
      # rails.root.joinはそのファイルまでのルートを表す
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      # デフォルト画像の設定。attachで添付、io:ファイル操作(ここではopen(open場所＝上で定義)),ファイルの名前,ファイルのタイプ
      
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    else
      image
    end
  end
end
