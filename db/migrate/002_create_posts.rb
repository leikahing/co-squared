migration 2, :create_posts do
  up do
    create_table :posts do
      column :id, Integer, :serial => true
      column :name, String, :length => 255
      column :body, Text
    end
  end

  down do
    drop_table :posts
  end
end
