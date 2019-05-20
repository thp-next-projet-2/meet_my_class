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

require 'rails_helper'

RSpec.describe Upvote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
