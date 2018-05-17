Types::UserType = GraphQL::ObjectType.define do
  name "User"
  description "A Faker User"
  field :user_id, types.String
  field :screen_name, types.String
  field :name, types.String
  field :uuid, types.String

  field :followers, types[Types::UserType] do
    argument :limit, types.Int, default_value: 10
    resolve ->(user, args, ctx) {
      user.followers.limit(args[:size])
    }
  end
end
