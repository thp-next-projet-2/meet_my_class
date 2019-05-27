# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  klass_id   :bigint
#
# Indexes
#
#  index_steps_on_klass_id  (klass_id)
#

require 'rails_helper'

RSpec.describe Step, type: :model do
  it { is_expected.to belong_to(:klass) }
  it { is_expected.to have_many(:progressions) }
  it { is_expected.to have_many(:students).through(:progressions) }
end
