class CreateBeneficiarios < ActiveRecord::Migration
  def change
    create_table :beneficiarios do |t|
      t.string :name
      t.string :cpf

      t.timestamps null: false
    end
  end
end
