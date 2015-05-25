class Period < ActiveRecord::Base
  belongs_to :fund

  validates :name, presence: true

  Quartal::TYPES.each do |type|
    name = type.to_sym
    has_one name, -> { where('obj_type = ?', type) },  dependent: :destroy, class_name: 'Quartal', inverse_of: :period
    accepts_nested_attributes_for name
  end
end
