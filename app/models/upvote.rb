# frozen_string_literal: true

# == Schema Information
#
# Table name: upvotes
#
#  id         :bigint           not null, primary key
#  upvote     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Upvote < ApplicationRecord
  belongs_to :student
  belongs_to :question
end
