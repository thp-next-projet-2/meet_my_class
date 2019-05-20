# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class Question < ApplicationRecord
  belongs_to :student
  has_many :upvotes, dependent: :destroy
  belongs_to :questionable, polymorphic: true
end
