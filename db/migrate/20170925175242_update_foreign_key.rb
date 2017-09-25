class UpdateForeignKey < ActiveRecord::Migration[5.1]
  def change
  	# remove the old foreign_key
    remove_foreign_key :comments, :posts

    # add the new foreign_key
    add_foreign_key :comments, :posts, on_delete: :cascade
  end
end
