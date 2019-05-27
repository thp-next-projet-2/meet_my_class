# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  is_teacher             :boolean          default(FALSE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_students_on_email                 (email) UNIQUE
#  index_students_on_reset_password_token  (reset_password_token) UNIQUE
#

class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # * # TODO: after_create: send_invitation_mail *

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true

  has_many :attendances, dependent: :destroy
  has_many :klasses, through: :attendances

  has_many :progressions, dependent: :destroy
  has_many :steps, through: :progressions

  has_many :questions, dependent: :destroy
  has_many :upvotes, dependent: :destroy

  def self.not_attending(klass_id)
    Student.joins(:attendances)
           .where("attendances.klass_id != ?", klass_id)
           .where.not("attendances.klass_id = ?", klass_id)
           .order(:email)
  end
end
