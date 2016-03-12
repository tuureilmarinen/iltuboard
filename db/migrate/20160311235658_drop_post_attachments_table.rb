class DropPostAttachmentsTable < ActiveRecord::Migration
  def up
    drop_table :post_attachments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
