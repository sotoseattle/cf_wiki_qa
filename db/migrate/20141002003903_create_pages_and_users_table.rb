class CreatePagesAndUsersTable < ActiveRecord::Migration
  def change
    create_table :pages_users, id: false do |t|
      t.belongs_to :page
      t.belongs_to :user
    end
  end
end
