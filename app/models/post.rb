class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :commenters, through: :comments
  has_many :votes
  has_many :voters, through: :votes

  def votes_count
    self.votes.count
  end

  def upvotes
    self.votes.inject(0) do |sum, vote|
      if(vote.upvote)
        sum+=1
      else
        sum
      end
    end
  end

  def downvotes
    self.votes.inject(0) do |sum, vote|
      if(vote.upvote == false)
        sum+=1
      else
        sum
      end
    end
  end



end
