# == Schema Information
#
# Table name: periods
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  fund_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Period < ActiveRecord::Base
  belongs_to :fund

  validates :name, presence: true

  Quartal::TYPES.each do |type|
    name = type.to_sym
    has_one name, -> { where('obj_type = ?', type) },  dependent: :destroy, class_name: 'Quartal', inverse_of: :period
    accepts_nested_attributes_for name
  end
end
