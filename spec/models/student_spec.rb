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
  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(default: "", null: false) }
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:inet) }
    it { is_expected.to have_db_column(:first_name).of_type(:string).with_options(default: "", null: false) }
    it { is_expected.to have_db_column(:last_name).of_type(:string).with_options(default: "", null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(default: "", null: false) }
    it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:inet) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:sign_in_count).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    let(:student) { build(:student) }

    it { expect(student).to have_many(:attendances).dependent(:destroy) }
    it { expect(student).to have_many(:klasses).through(:attendances).dependent(:destroy) }
    it { expect(student).to have_many(:progressions).dependent(:destroy) }
    it { expect(student).to have_many(:questions).dependent(:destroy) }
    it { expect(student).to have_many(:upvotes).dependent(:destroy) }
  end

  describe "Validations" do
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'Factories' do
    context 'with valid attributes' do
      let!(:student) { build(:student) }

      it { expect(student.errors).to be_empty }

      it "is valid with valid attributes" do
        expect(student).to be_valid
      end
    end

    context 'with unvalid email' do
      let(:student) { build(:student, email: nil) }

      it "is not valid without email" do
        expect(student).not_to be_valid
      end
    end
  
  end
end
