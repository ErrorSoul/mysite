# == Schema Information
#
# Table name: partner_pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PartnerPage < ActiveRecord::Base
 
end
