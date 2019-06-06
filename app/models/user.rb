# frozen_string_literal: true

# == Schema Information
#
# Table name: users
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
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :email, uniqueness: { case_sensitive: false } # , format: { with: /\A[a-zA-Z0-9 _\.]*\z/ }

  # As student
  has_many :attendances,
           foreign_key: 'student_id',
           inverse_of: :students,
           dependent: :destroy

  has_many :klasses,
           foreign_key: 'student_id',
           through: :attendances,
           inverse_of: :students,
           dependent: :destroy

  has_many :progressions, inverse_of: 'student', dependent: :destroy
  # has_many :steps, through: :progressions

  has_many :questions, inverse_of: 'student', dependent: :destroy
  has_many :upvotes, inverse_of: 'student', dependent: :destroy

  # As teacher
  has_many :given_klasses,
           class_name: 'Klass',
           foreign_key: 'teacher_id',
           inverse_of: 'teacher',
           dependent: :destroy

  has_many :lessons, foreign_key: 'teacher_id', inverse_of: :teacher, dependent: :destroy
end
