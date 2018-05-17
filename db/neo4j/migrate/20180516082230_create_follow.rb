class CreateFollow < Neo4j::Migrations::Base
  def up
    add_constraint :Follow, :uuid
  end

  def down
    drop_constraint :Follow, :uuid
  end
end
