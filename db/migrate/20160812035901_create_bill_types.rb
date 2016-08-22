class CreateBillTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_types do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
