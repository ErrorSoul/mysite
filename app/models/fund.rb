# == Schema Information
#
# Table name: funds
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  info       :text(65535)
#  strategy   :text(65535)
#  condition  :text(65535)
#

class Fund < ActiveRecord::Base
  has_many :pages, as: :pageable
  has_many :periods
  has_many :pieces

  def human_name
    name.in?(%w(isu_capital isu_ai isu_a2 isu_a3)) ? I18n.t(:docs) : I18n.t(:docs_isu)
  end

  def human_about
     name.in?(%w(isu_capital isu_ai isu_a2 isu_a3)) ? I18n.t(:about_isu) : I18n.t(:about_fund)
  end

end
