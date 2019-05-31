# frozen_string_literal: true

# == Schema Information
#
# Table name: progressions
#
#  id         :bigint           not null, primary key
#  completed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  step_id    :bigint
#  student_id :bigint
#
# Indexes
#
#  index_progressions_on_step_id     (step_id)
#  index_progressions_on_student_id  (student_id)
#

require 'rails_helper'

RSpec.describe Progression, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:student_id).of_type(:integer) }
    it { is_expected.to have_db_column(:step_id).of_type(:integer) }
    it { is_expected.to have_db_column(:completed) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "Associations" do
    let(:progression) { build(:progression) }

    it { expect(progression).to belong_to(:student) }
    it { expect(progression).to belong_to(:step) }
  end

  describe 'Factories' do
    context 'with valid attributes' do
      let!(:progression) { build(:progression) }

      it { expect(progression.errors).to be_empty }

      it "is valid with valid attributes" do
        expect(progression).to be_valid
      end
    end

    context 'with unvalid attributes' do
      let(:progression_wrong_step) { build(:progression, :invalid_step) }

      let(:progression_wrong_student) { build(:progression, :invalid_student) }

      it "is not valid with unvalid user_id" do
        expect(progression_wrong_step).not_to be_valid
      end

      it "is not valid with unvalid student_id" do
        expect(progression_wrong_student).not_to be_valid
      end
    end
  end
end
