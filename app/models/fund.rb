class Fund < ActiveRecord::Base

  has_many :pages, as: :pageable
  has_many :periods

end
