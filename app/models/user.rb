class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :camera, dependent: :destroy
        
        validates :name, presence: true
        validates :profile, length: { maximum: 200 }

        mount_uploader :image, ImageUploader

        def posts
          return Camera.where(user_id: self.id)
        end

        has_many :comments, dependent: :destroy

        has_many :likes, dependent: :destroy
        has_many :liked_cameras, through: :likes, source: :camera

        def already_liked?(camera)
          self.likes.exists?(camera_id: camera.id)
        end
end
