# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  klass_id    :bigint
#
# Indexes
#
#  index_steps_on_klass_id  (klass_id)
#

require 'rails_helper'

RSpec.describe Step, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:klass_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    let(:step) { build(:step) }

    it { expect(step).to belong_to(:klass) }
    it { expect(step).to have_many(:progressions).dependent(:destroy) }
    # it { is_expected.to have_many(:students).through(:progressions) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:name).is_at_least(2) }
  end

  describe 'Factories' do
    context 'with valid attributes' do
      let!(:step) { build(:step) }

      it { expect(step.errors).to be_empty }

      it "is valid with valid attributes" do
        expect(step).to be_valid
      end
    end

    context 'with unvalid attributes' do
      let(:step_invalid_name) { build(:step, :invalid_name) }

      let(:step_invalid_klass) { build(:step, :invalid_klass) }

      it "is not valid without name" do
        expect(step_invalid_name).not_to be_valid
      end

      it "is not valid with unvalid klass" do
        expect(step_invalid_klass).not_to be_valid
      end
    end
  end
end
