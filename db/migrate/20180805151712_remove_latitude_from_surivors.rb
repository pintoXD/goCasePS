class RemoveLatitudeFromSurivors < ActiveRecord::Migration[5.2]
  def change

    remove_column :survivors, :location

    add_column :survivors, :latitude, :string
    add_column :survivors, :longitude, :string


  end
end
