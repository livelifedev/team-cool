class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :email
      t.integer :reason

      t.timestamps
    end
  end
end

