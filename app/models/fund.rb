class Fund < ActiveRecord::Base

  has_many :pages, as: :pageable

end
