class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :confirmable,
         # :recoverable,
         :rememberable,
         :validatable

  def admin?
    id == 1
  end
end
