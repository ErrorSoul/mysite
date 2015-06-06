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
end
