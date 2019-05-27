# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_students_on_email                 (email) UNIQUE
#  index_students_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = FactoryBot.create(:student)
  end

  it "has a valid factory" do
    expect(build(:student)).to be_valid
  end

  it { expect(FactoryBot.create(:student)).to have_many(:attendances) }
end
