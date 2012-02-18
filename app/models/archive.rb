class Archive < ActiveRecord::Base
  validates_uniqueness_of :archiveID
end
