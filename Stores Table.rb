create_table "stores", force: :cascade do |t|
    t.string "name", null: false, limit: 60
    t.string "address", null: false, limit: 400
    t.references "user", foreign_key: true  # Store Owner
    t.timestamps
  end
  