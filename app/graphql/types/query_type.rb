Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  field :users, types.String do
    type Types::UserType
    description 'Twitter user'
    argument :name, types.String
    resolve ->(obj, args, ctx) {
      User.find_by(name: args['name'])
    }
  end
end
