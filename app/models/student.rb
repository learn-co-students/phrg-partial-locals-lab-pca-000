# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(s_name)
    all.select { |stud| stud.name.downcase.include?(s_name.downcase) }
    # where(name: s_name)
  end
end
