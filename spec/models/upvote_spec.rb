# frozen_string_literal: true

# == Schema Information
#
# Table name: upvotes
#
#  id          :bigint           not null, primary key
#  upvote      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint
#  student_id  :bigint
#
# Indexes
#
#  index_upvotes_on_question_id  (question_id)
#  index_upvotes_on_student_id   (student_id)
#

require 'rails_helper'

RSpec.describe Upvote, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:upvote).of_type(:boolean) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:student_id).of_type(:integer) }
    it { is_expected.to have_db_column(:question_id).of_type(:integer) }
  end

  describe "Associations" do
    let(:upvote) { build(:upvote) }

    it { expect(upvote).to belong_to(:student) }
    it { expect(upvote).to belong_to(:question) }
  end

  describe 'Factories' do
    context 'with valid attributes' do
      let!(:upvote) { build(:upvote) }

      it { expect(upvote.errors).to be_empty }

      it "is valid with valid attributes" do
        expect(upvote).to be_valid
      end
    end

    context 'with unvalid student_id' do
      let(:upvote) { build(:upvote, student_id: nil) }

      it "is not valid without student_id" do
        expect(upvote).not_to be_valid
      end
    end

    context 'with unvalid question' do
      let(:upvote) { build(:upvote, question_id: nil) }

      it "is not valid without question" do
        expect(upvote).not_to be_valid
      end
    end
  end
end
