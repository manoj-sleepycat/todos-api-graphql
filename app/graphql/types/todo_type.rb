module Types
  class TodoType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :created_by, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :items, [Types::ItemType], null: true
    field :items_count, Integer, null: true

    def items_count
      object.items.size
    end
  end
end
