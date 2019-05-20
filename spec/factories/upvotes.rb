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

FactoryBot.define do
  factory :upvote do
    upvote { false }
  end
end
