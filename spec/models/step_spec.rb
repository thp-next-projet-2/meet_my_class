# == Schema Information
#
# Table name: steps
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  klasse_id  :bigint
#
# Indexes
#
#  index_steps_on_klasse_id  (klasse_id)
#
# Foreign Keys
#
#  fk_rails_...  (klasse_id => klasses.id)
#

require 'rails_helper'

RSpec.describe Step, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
