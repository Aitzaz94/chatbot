class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.text :content
      t.string :role, default: "user"

      t.timestamps
    end
  end
end
