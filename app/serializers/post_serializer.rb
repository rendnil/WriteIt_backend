class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :upvotes, :downvotes, :author_id, :created_at
end
