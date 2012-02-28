class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :content
      t.datetime :created_at
    end
  end
end
