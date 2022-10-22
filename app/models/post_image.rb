class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  # 呼び出したい処理名
  def get_image
    # もしimageが添付されていなければno_image.jpgを呼び出す
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    else
      image
    end
  end
end
