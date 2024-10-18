create_table "users", force: :cascade do |t|
  t.string "name", null: false, limit: 60
  t.string "email", null: false
  t.string "encrypted_password", null: false
  t.string "role", default: 'normal_user'
  t.string "address", null: false, limit: 400
  t.timestamps
end
add_index "users", ["email"], unique: true
