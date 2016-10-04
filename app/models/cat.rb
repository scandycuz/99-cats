# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  COLORS = %w(red blue green brown black grey)

  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: { in: COLORS, message: "%{value} is not a valid color" }
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F), message: "%{value} is not a valid sex" }

  def age
    Time.now.year - self.birth_date.year
  end
end
