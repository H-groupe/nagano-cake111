class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  def full_name #結合してフルネームを返す
    family_name + '' + first_name
  end
  
  def full_name_kana #結合してフルネームを返す
    family_name_kana + '' + first_name_kana
  end
  
  def customer_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end
  
  def active_for_authentication? #退会したユーザーがログインできないようにするためのメソッド
    super && (is_deleted == false) #deviseの認証が有効で、かつユーザーが退会していない状態（is_deletedがfalse`）であるユーザーだけが認証できる
  end
  
end