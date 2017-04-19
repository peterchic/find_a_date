class User < ApplicationRecord
  has_secure_password
  has_many :user_interests
  has_many :interests, through: :user_interests

  validates_presence_of :name
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

  def matches_orientation(user)
    if self.orientation == 'straight'
      user.sex != self.sex
    else
      user.sex == self.sex
    end
    # binding.pry
  end

  def find_a_match
    users = User.joins(:user_interests).where('user_interests.interest_id IN (?)', self.interest_ids).where.not(id: self.id)
     #find all users that have same interests, excluding 'me'
     users.select do |user|
      #  binding.pry
       self.matches_orientation(user)
     end
  end

  # search by sexual orientation:
  # find people with the same orientation


  #if person is straight: finds all people of opposite gender, also Straight

end
