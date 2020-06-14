class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string        :post_number,   null:false
      t.string        :city,          null:false
      t.string        :block,         null:false
      t.string        :address,       null:false
      t.string        :bulding_name,  null:false
      t.references    :user,          foreign_key: true

      t.timestamps
    end
  end
end
# rake db:drop