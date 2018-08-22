class Language < ActiveRecord::Base
  has_many :repo_langs
  has_many :repositories, through: :repo_langs
end
