class Page < ActiveRecord::Base

  PARTIALS = %w(main about contact open_info docs).freeze

  ASSETS   = %w(open_info docs)

  has_many :assets, dependent: :destroy, inverse_of: :page

  belongs_to :pageable, polymorphic: true

  accepts_nested_attributes_for :assets, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }

end
