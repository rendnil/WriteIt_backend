class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}

  has_many :posts, foreign_key: "author_id"
  has_many :comments, foreign_key: "commenter_id"
  has_many :votes, foreign_key: "voter_id"


end
