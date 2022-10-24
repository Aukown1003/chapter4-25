class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #user = 1　に対して多数 = Nのpost_imegesがある
        #dependent: :destroyは１側が削除された時N側も削除されるという意味
        # N側にも設定が必要！
  has_many :post_images, dependent: :destroy
end
