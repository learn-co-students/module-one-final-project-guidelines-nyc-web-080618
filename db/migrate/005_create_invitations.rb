class CreateInvitations < ActiveRecord::Migration[5.0]

  def change
    create_table :invitations do |t|
      t.integer :guest_star_id
      t.integer :event_id
      t.string :guest_performance
    end
  end

end
