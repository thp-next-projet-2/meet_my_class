# frozen_string_literal: true

# == Schema Information
#
# Table name: klasses
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  teacher_id  :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_klasses_on_teacher_id  (teacher_id)
#  index_klasses_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Klass, type: :model do
  it "has a valid factory" do
    expect(build(:klass)).to be_valid
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:teacher_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    let(:klass) { build(:klass) }

    it { is_expected.to belong_to(:teacher) }
    it { is_expected.to have_many(:steps).dependent(:destroy) }
    it { is_expected.to have_many(:questions).dependent(:destroy) }
    it { expect(klass).to have_many(:attendances).dependent(:destroy) }
  end

  describe "Validation" do
    # it { should validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:description).is_at_least(15) }
  end

  describe 'Build factories' do
    context 'with valid attributes' do
      let!(:klass) { build(:klass) }

      it { expect(klass.errors).to be_empty }

      it "is valid with valid attributes" do
        expect(klass).to be_valid
      end
    end

    context 'with nil attributes' do
      let(:klass_nil_title) { build(:klass, :nil_title) }

      it "is unvalid with nil status" do
        expect(klass_nil_title).not_to be_valid
      end

      # let(:klass_nil_teacher) { build(:klass, :nil_teacher) }

      #  ==> don't work why ? i don't understand
      # it "is unvalid with nil student_id" do
      #   expect(klass_nil_teacher).not_to be_valid
      # end
    end
  end
end
