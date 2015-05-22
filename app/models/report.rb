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
