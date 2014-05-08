class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :display_name,
    presence: true,
    uniqueness: true,
    length: { maximum: 25, minimum: 5 },
    format: { with: /\A[a-z0-9_-]{5,25}\z/ }
end
