# frozen_string_literal: true

# == Schema Information
#
# Table name: klasses
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Klass < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :students, through: :attendances
  has_many :steps, dependent: :destroy
end
