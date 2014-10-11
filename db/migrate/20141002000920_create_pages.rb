class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :question
      t.text :answer

      t.timestamps
    end
  end
end
