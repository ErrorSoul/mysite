class Asset < ActiveRecord::Base
  belongs_to :page

  mount_uploader :asset, AttachUploader

  def file_name
    asset.file.try(:original_filename)
  end

  def file_url
    asset.url
  end
end
