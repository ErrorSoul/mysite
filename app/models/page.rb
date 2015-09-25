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

  accepts_nested_attributes_for :assets, allow_destroy: true,
    reject_if: proc { |attributes| attributes['name'].blank?  || attributes['asset'].blank?}

  def fund
    pageable if pageable.class.to_s == 'Fund'
  end

  def main_page
    pageable if pageable.class.to_s == 'Page'
  end

  def human_name
    if  name == 'docs' && fund
      fund.name.in?(%w(isu_capital isu_ai isu_a3 isu_a2)) ? I18n.t(:docs_isu) : I18n.t(:docs)
    else
      I18n.t(name)
    end
  end

  def make_copy
    page_new = Page.new
    page_new.name = self.name
    page_new.content = self.content
    page_new.save!
    page_new
  end

end
