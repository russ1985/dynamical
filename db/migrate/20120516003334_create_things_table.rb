class CreateThingsTable < ActiveRecord::Migration
  def up
    create_table :things do |t|
	  t.text    :how
	  t.string  :what
	  t.integer :times_done_it
	end
  end

  def down
  end
end
