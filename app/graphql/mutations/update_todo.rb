module Mutations
  class UpdateTodo < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :created_by, String, required: false

    field :todo, Types::TodoType, null: false
    field :errors, [String], null: false

    def resolve(id:, title: nil, created_by: nil)
      todo = Todo.find(id)
      # todo.update(title: title, created_by: created_by)
      # {
      #   todo: todo
      # }

      if todo.update(title: title || todo.title, created_by: created_by || todo.created_by)
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