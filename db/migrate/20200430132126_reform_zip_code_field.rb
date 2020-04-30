class ReformZipCodeField < ActiveRecord::Migration[5.2]
  def change
    change_table :doctors do |t|
      t.rename :zip_co, :zip_code
    end
  end
end
