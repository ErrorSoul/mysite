class Page < ActiveRecord::Base

  PARTIALS = %w(main about contact).freeze

  ASSETS   = %w(open_info docs)

  has_many :assets, dependent: :destroy, inverse_of: :page

  accepts_nested_attributes_for :assets, allow_destroy: true

end
