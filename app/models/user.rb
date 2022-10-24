class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #  # 1対１(単数枚画像投稿)で関連付けるという宣言 = profile_image
  has_one_attached :profile_image
  
          #ここから 
  # 1のuserが消された時nのpost_imagesとpost_commentsも同時に消える
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
        # ここまでがモデル同士の関係になる
  
  # モデルの中にdef endで定義をすることで特定の処理を名前で呼び出すことができる
  # 今回はget_profile_imageを呼び出したときに実行する内容を記載
  def get_profile_image(width,height)
# profile_imageがなかった時
    unless profile_image.attached?
# file_pathとして画像を呼び出し
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
# デフォルト画像の設定。attachで添付、io:ファイル操作(ここではopen(open場所＝上で定義)),ファイルの名前,ファイルのタイプ
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # variant = variant[変異させる](リサイズ).processed[リサイズしたurlを返すので二回目以降の読み込み速度が上がる]
    # resize_to_limit = 画像の縦横比を維持したまま　対象の画像のサイズが引数に指定された縦横サイズ以内の場合はリサイズしない。
    # 今回の場合は100以下の場合はそのままになる
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

        #user = 1　に対して多数 = Nのpost_imegesがある
        #dependent: :destroyは１側が削除された時N側も削除されるという意味
        # N側にも設定が必要！
  has_many :post_images, dependent: :destroy
end
