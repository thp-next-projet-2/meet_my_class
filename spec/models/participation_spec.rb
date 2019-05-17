# == Schema Information
#
# Table name: participations
#
#  id         :bigint           not null, primary key
#  connect_at :datetime
#  invited_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  klasse_id  :bigint
#  student_id :bigint
#
# Indexes
#
#  index_participations_on_klasse_id   (klasse_id)
#  index_participations_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (klasse_id => klasses.id)
#  fk_rails_...  (student_id => students.id)
#

require 'rails_helper'

RSpec.describe Participation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
