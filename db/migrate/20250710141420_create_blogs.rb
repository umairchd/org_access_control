class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.integer :age_group

      t.timestamps
    end
  end
end
