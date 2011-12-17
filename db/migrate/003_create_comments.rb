migration 3, :create_comments do
  up do
    create_table :comments do
      column :id, Integer, :serial => true
      
    end
  end

  down do
    drop_table :comments
  end
end
