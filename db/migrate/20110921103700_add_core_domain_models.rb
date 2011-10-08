class AddCoreDomainModels < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city,         :null => false, :limit => 120, :index => :unique
    end

    create_table :venues do |t|
      t.string  :slug,         :null => false, :limit => 60, :index => :unique
      t.string  :name,         :null => false, :limit => 60
      t.text    :description
      t.integer :city_id,      :null => false, :index => true

      t.string  :address_street
      t.integer :address_postal_code

      t.timestamps
    end

    create_table :artists do |t|
      t.string :name,         :null => false, :limit => 60
      t.string :slug,         :null => false, :limit => 60, :index => :unique
      t.string :tagline
      t.text   :description

      t.string :image

      t.timestamps
    end

    create_table :events do |t|
      t.integer  :venue_id,    :null => false
      t.integer  :promoter_id, :null => false, :references => :users

      t.string   :slug,        :null => false, :limit => 130, :index => :unique
      t.string   :title,       :null => false, :limit => 120
      t.text     :description

      t.datetime :start_at,     :null => false
      t.datetime :end_at,       :null => false

      t.timestamps
    end

    create_table :appearances do |t|
      t.integer :artist_id, :null => :false
      t.integer :event_id,  :null => :false, :index => { :with => :artist_id, :unique => true }
    end
  end
end
