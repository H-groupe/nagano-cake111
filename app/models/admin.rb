class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.authenticate(email, password)
    # 特定の管理者のメールアドレスとパスワードの場合のみ認証を許可
    if email == 'nagano@cake.com' && password == '123456'
      find_by(email: email)&.authenticate(password)
    else
      nil
    end
  end
  
  def admin?
    #管理者を判断する基準
    email == 'nagano@cake.com'
  end

end
