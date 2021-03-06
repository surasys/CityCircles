class CreateSuggestions < ActiveRecord::Migration
  def self.up
    create_table :suggestions, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :email, :limit => 100, :null => false
      t.string :body, :limit => 5000, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :suggestions
  end
end
