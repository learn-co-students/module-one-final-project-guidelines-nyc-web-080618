class CreateGuestStars < ActiveRecord::Migration[5.0]

  def change
    create_table :guest_stars do |t|
      t.string :name
    end
  end

end
