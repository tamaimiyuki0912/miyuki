class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :camera, dependent: :destroy
        validates :name, presence: true
        validates :profile, length: { maximum: 200 }

        def posts
          return Camera.where(user_id: self.id)
        end
end
