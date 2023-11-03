class AddFieldsToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :medical_history, :text
    add_column :clients, :insurance_provider, :string
    add_column :clients, :insurance_number, :string
    add_column :clients, :dental_concerns, :text
    add_column :clients, :password, :string
  end
end
