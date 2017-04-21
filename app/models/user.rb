class User < ApplicationRecord
  has_secure_password
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :sent_messages, class_name: "Message"
  has_many :received_messages, class_name: "Message", foreign_key: 'match_id'

  validates_presence_of :name

  # def received_messages
  #   Message.where(match_id: self.id)
  # end
  # :city, :sex, :orientation, :ethnicity, :height, :physical_shape, :children, :relationship, :education, :image, :bio, :age,
  # validates :bio, length: {minimum: 1, maximum: 1000}

  # def method to look through all interest
  # FINDS THE MATCHES ON THE TABLE

  # def search
  #   self.interests.each do |interest|
  #     interest.users.each do |user|
  #       user.name
  #     end
  #   end
  #
  # end

  # def matches_orientation(user)
  #   if self.orientation == 'Straight'
  #     user.sex != self.sex
  #   else
  #     user.sex == self.sex
  #   end
  #   # binding.pry
  # end

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





  # search by sexual orientation:
  # find people with the same orientation


  #if person is straight: finds all people of opposite gender, also Straight

end
