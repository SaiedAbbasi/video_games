class Keywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.text :name
    end  
  end
end
