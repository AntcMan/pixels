class AddUploadDateToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :date_uploaded, :datetime
  end
end
