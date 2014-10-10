class Payment < ActiveRecord::Base

  belongs_to :upload, :counter_cache => true
end
