class Camera < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :user

    def user
        return User.find_by(id: self.user_id)
    end

    has_many :comments, dependent: :destroy

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

end
