class Page < ActiveRecord::Base

  PARTIALS = %w(main about contact open_info docs report pay).freeze

  ASSETS   = %w(open_info docs)

  has_many :assets, dependent: :destroy, inverse_of: :page

  belongs_to :pageable, polymorphic: true
  has_many :pages, as: :pageable

  accepts_nested_attributes_for :assets, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }

  def fund
    pageable if pageable.class.to_s == 'Fund'
  end

end
