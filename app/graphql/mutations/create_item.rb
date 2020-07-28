module Mutations
  class CreateItem < BaseMutation
    argument :name, String, required: true
    argument :done, Boolean, required: true
    argument :todo_id, Integer, required: true

    field :item, Types::ItemType, null: false
    # field :errors, [String], null: false

    def resolve(name:, done:, todo_id:)
      item = Item.create!(name: name, done: done, todo_id: todo_id)

      {
        item: item
      }

      # if item.save
      #   {
      #     item: item,
      #     errors: []
      #   }
      # else
      #   {
      #     item: nil,
      #     errors: item.errors.full_messages
      #   }
      # end
    end
  end
end
