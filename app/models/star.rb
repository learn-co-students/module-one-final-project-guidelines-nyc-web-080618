class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :starred_repository, :class_name => "Repository"
end
