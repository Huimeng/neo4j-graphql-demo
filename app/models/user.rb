class User 
  include Neo4j::ActiveNode
  property :user_id, type: String
  property :screen_name, type: String
  property :name, type: String

  has_many :in, :followers, model_class: :User, rel_class: :Follow

end
