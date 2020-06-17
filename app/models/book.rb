class Book < ApplicationRecord
  belongs_to :user

  def user
    return User.find_by(id: self.user_id)
  end

  validates :title, :body, {presence: true}
  validates :body, length: {maximum: 200}
end
