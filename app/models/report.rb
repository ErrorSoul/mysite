# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  firm       :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  obj_type   :string(255)
#

class Report < ActiveRecord::Base

  validates :name, :phone,  presence: true

  with_options if: proc { |report|
    report.obj_type == 'presentation'
  } do |report|
    report.validates :firm, presence: true
  end

  with_options if: proc { |report|
    report.obj_type == 'message'
  } do |report|
    report.validates :body, presence: true
  end

end
