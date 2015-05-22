class Post < ActiveRecord::Base

  scope :releases, -> { where(object_type: "release") }
  scope :smis, -> { where(object_type: "smi")}
  scope :reverse_order, -> { order("created_at DESC") }
end
