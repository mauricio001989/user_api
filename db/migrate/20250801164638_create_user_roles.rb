class CreateUserRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :user_roles, id: :uuid do |t|
      t.references :role, type: :uuid, foreign_key: { on_delete: :cascade }
      t.references :user, type: :uuid, foreign_key: { on_delete: :cascade }

      t.timestamps
    end

    add_index :user_roles, [ :user_id, :role_id ], unique: true
  end
end
