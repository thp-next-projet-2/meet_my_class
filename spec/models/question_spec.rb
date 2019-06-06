# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  klass_id    :bigint
#  student_id  :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_questions_on_klass_id    (klass_id)
#  index_questions_on_student_id  (student_id)
#  index_questions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (klass_id => klasses.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:student_id).of_type(:integer) }
    it { is_expected.to have_db_column(:klass_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    let(:question) { build(:question) }

    it { expect(question).to belong_to(:student) }
    it { expect(question).to belong_to(:klass) }
    it { expect(question).to have_many(:upvotes).dependent(:destroy) }
  end

  describe "Validations" do
    it { is_expected.to validate_length_of(:description).is_at_least(10) }
  end

  describe 'Factories' do
    context 'with valid attributes' do
      let!(:question) { build(:question) }

      it { expect(question.errors).to be_empty }

      it "is valid with valid attributes" do
        expect(question).to be_valid
      end
    end

    context 'with unvalid attributes' do
      let(:question_invalid_student) { build(:question, :invalid_student) }

      let(:question_invalid_klass) { build(:question, :invalid_klass) }

      it "is not valid with unvalid student_id" do
        expect(question_invalid_student).not_to be_valid
      end

      it "is not valid with unvalid klass" do
        expect(question_invalid_klass).not_to be_valid
      end
    end
  end
end
