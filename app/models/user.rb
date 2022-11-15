class User < ApplicationRecord
  has_many :practices, dependent: :destroy
  has_many :targets, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable, :lockable, :timeoutable

  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])/

    errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase and 1 digit'
  end
end
