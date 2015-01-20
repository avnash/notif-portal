class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.string :subscriptions
      t.integer :user_id

      t.timestamps
    end
  end
end
