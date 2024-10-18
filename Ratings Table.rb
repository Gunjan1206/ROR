create_table "ratings", force: :cascade do |t|
    t.integer "score", null: false
    t.references "user", foreign_key: true  # Normal user
    t.references "store", foreign_key: true
    t.timestamps
  end
  