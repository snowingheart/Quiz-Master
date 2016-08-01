class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :answer
      t.string :query

      t.timestamps null: false
    end
  end
end
