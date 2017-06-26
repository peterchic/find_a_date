class User < ApplicationRecord
  has_secure_password
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :sent_messages, class_name: "Message"
  has_many :received_messages, class_name: "Message", foreign_key: 'match_id'

  validates_presence_of :name

  def find_a_match
    users = User.joins(:user_interests).where('user_interests.interest_id IN (?)', self.interest_ids).where.not(id: self.id)
     #find all users that have same interests, excluding 'me'
    if self.orientation == 'Straight'
      result = users.select do |user|
        user.sex != self.sex && user.orientation == self.orientation
      end
      result.uniq
    elsif self.orientation == 'Lesbian' || self.orientation == 'Gay'
      result = users.select do |user|
         user.sex == self.sex && user.orientation == self.orientation
      end
      result.uniq
    else self.orientation == 'Fluent'
      result = users.select do |user|
        user.orientation == self.orientation
      end
      result.uniq
    end
  end

end
