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

  store_accessor :data, :first_name
  store_accessor :data, :last_name
  def full_name
    [first_name, last_name].join(" ")
  end
end
