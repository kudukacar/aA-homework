class CreateAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :auths do |t|
      t.string :username
      t.string :password_digest
      t.string :session_token
    end
  end
end
