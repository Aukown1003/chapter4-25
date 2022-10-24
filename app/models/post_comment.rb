class PostComment < ApplicationRecord
  # ここから
  belongs_to :user
  belongs_to :post_image
  # ここまでがモデル同士の関係になる
end
