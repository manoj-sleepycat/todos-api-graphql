module Mutations
  class CreateTodo < BaseMutation
    argument :title, String, required: true
    argument :created_by, String, required: true

    field :todo, Types::TodoType, null: false
    # field :errors, [String], null: false

    def resolve(title:, created_by:)
      todo = Todo.create!(title: title, created_by: created_by)
      {
        todo: todo
      }

      # if todo.save
      #   {
      #     todo: todo,
      #     errors: []
      #   }
      # else
      #   {
      #     todo: nil,
      #     errors: todo.errors.full_messages
      #   }
      # end
    end
  end
end
