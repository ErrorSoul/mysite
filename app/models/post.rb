# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  object_type :string(255)
#  title       :string(255)
#  body        :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  scope :releases, -> { where(object_type: 'release') }
  scope :smis, -> { where(object_type: 'smi') }
  scope :reverse_order, -> { order('created_at DESC') }
end
