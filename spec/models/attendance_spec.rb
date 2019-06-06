# frozen_string_literal: true

# == Schema Information
#
# Table name: attendances
#
#  id           :bigint           not null, primary key
#  connected_at :datetime
#  invited_at   :datetime
#  status       :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lesson_id    :bigint
#  student_id   :bigint
#
# Indexes
#
#  index_attendances_on_lesson_id   (lesson_id)
#  index_attendances_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (lesson_id => lessons.id)
#

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:student_id).of_type(:integer) }
    # it { is_expected.to have_db_column(:klass_id).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:connected_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:invited_at).of_type(:datetime) }
  end

  describe "Associations" do
    let(:attendance) { build(:attendance) }

    it { expect(attendance).to belong_to(:student) }
    #  it { expect(attendance).to belong_to(:klass) }
  end

  describe 'Factories' do
    context 'with valid attributes' do
      let!(:attendance) { build(:attendance) }

      it { expect(attendance.errors).to be_empty }

      # too complex to build

      # it "is valid with valid attributes" do
      #   expect(attendance).to be_valid
      # end
    end

    context 'with unvalid attributes' do
      let(:attendance_wrong_status) { build(:attendance, :invalid_status) }

      let(:attendance_wrong_student) { build(:attendance, :invalid_student) }

      #  let(:attendance_wrong_klass) { build(:attendance, :invalid_klass) }

      it "is not valid with unvalid status" do
        expect(attendance_wrong_status).not_to be_valid
      end

      it "is not valid with unvalid student_id" do
        expect(attendance_wrong_student).not_to be_valid
      end

      #  it "is not valid with unvalid klass_id" do
      #    expect(attendance_wrong_klass).not_to be_valid
      #  end
    end
  end
end
