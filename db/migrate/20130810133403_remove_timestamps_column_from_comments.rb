class RemoveTimestampsColumnFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :timestamps, :string
  end
end
