module Mutations
  class DeleteTodo < BaseMutation
    argument :id, ID, required: true

    field :todo, Types::TodoType, null: false
    field :errors, [String], null: false

    def resolve(id:)
      todo = Todo.find(id)

      if todo.destroy
        {
          todo: todo,
          errors: []
        }
      else
        {
          todo: nil,
          errors: todo.errors.full_messages
        }
      end
    end
  end
end