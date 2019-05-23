# frozen_string_literal: true

# == Schema Information
#
# Table name: teachers
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_teachers_on_email                 (email) UNIQUE
#  index_teachers_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { is_expected.to have_many(:klasses) }
end
