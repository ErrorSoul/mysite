# == Schema Information
#
# Table name: pages
#
#  id            :integer          not null, primary key
#  content       :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string(255)
#  pageable_id   :integer
#  pageable_type :string(255)
#

class Page < ActiveRecord::Base
  PARTIALS = %w(main about contact open_info docs report pay to_partners).freeze

  ASSETS   = %w(open_info docs)

  has_many :assets, dependent: :destroy, inverse_of: :page

  belongs_to :pageable, polymorphic: true
  has_many :pages, as: :pageable

  accepts_nested_attributes_for :assets, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }

  def fund
    pageable if pageable.class.to_s == 'Fund'
  end

  def main_page
    pageable if pageable.class.to_s == 'Page'
  end
end
