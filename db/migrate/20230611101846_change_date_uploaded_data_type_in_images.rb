class ChangeDateUploadedDataTypeInImages < ActiveRecord::Migration[7.0]
  def change
    change_column :images, :date_uploaded, :date
  end
end
