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

class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates :email, uniqueness: { case_sensitive: false } # , format: { with: /\A[a-zA-Z0-9 _\.]*\z/ }

  has_many :attendances, dependent: :destroy
  has_many :klasses, through: :attendances

  has_many :progressions, dependent: :destroy
  # has_many :steps, through: :progressions

  has_many :questions, dependent: :destroy
  has_many :upvotes, dependent: :destroy

  # def self.not_attending(klass_id)
  #   # * # TODO: Find a way to really exclude those who attend *
  #   Student.joins(:klasses)
  #          .where.not("klasses.id = ?", klass_id)
  #          .where("klasses.id != ?", klass_id)
  #          .order(:email).distinct
  # end
end
