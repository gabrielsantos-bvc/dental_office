class CreateDentists < ActiveRecord::Migration[7.1]
  def change
    create_table :dentists do |t|
      t.string :name
      t.string :expertise

      t.timestamps
    end
  end
end
