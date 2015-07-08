# == Schema Information
#
# Table name: assets
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  asset         :string(255)
#  type          :string(255)
#  page_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  publicated_at :datetime
#

class Asset < ActiveRecord::Base
  belongs_to :page
  belongs_to :period
  default_scope { order('publicated_at DESC') }

  mount_uploader :asset, AttachUploader
  #validates :name, presence: true

  def file_name
    asset.file.try(:original_filename)
  end

  def file_url
    asset.url
  end
end
