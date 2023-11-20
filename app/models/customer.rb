class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  attribute :telephone_number, :string
  attribute :postal_code, :string
  attribute :is_membership_status, :boolean

  
  def full_name #結合してフルネームを返す
    family_name + '' + first_name
  end
  
  def full_name_kana #結合してフルネームを返す
    family_name_kana + '' + first_name_kana
  end
  
  def customer_status
    if is_membership_status
      "有効"
    else
      "退会"
    end
  end
  
  def customer_params
    # 必要に応じて許可する属性を指定
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, 
                                     :first_name_kana, :postal_code, :address, :telephone_number, 
                                     :email, :is_membership_status)
  end

  
  #def active_for_authentication? #退会したユーザーがログインできないようにするためのメソッド
  #  super && (is_deleted == false) #deviseの認証が有効で、かつユーザーが退会していない状態（is_deletedがfalse`）であるユーザーだけが認証できる
  #end
  
end