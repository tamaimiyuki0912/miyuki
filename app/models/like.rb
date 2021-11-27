class Like < ApplicationRecord

  belongs_to :user
  belongs_to :camera
  

  validates_uniqueness_of :camera_id, scope: :user_id

end
