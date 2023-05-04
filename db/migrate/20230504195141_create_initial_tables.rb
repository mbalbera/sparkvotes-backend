class CreateInitialTables < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    # create elections table
    create_table :elections, id: :uuid do |t|
      t.string :description
      t.datetime :electionDate
      t.timestamps
    end

      # create races table
    create_table :races, id: :uuid do |t|
      t.integer :range
      t.string :position
      t.string :year
      t.references :election, type: :uuid, foreign_key: true
      t.timestamps
    end

    # create issues table
    create_table :issues, id: :uuid do |t|
      t.string :title
      t.string :description
      t.timestamps
    end

    # create race_issues table
    create_table :race_issues, id: :uuid do |t|
      t.references :race, type: :uuid, foreign_key: true
      t.references :issue, type: :uuid, foreign_key: true
      t.timestamps
    end

    # create parties table
    create_table :parties, id: :uuid do |t|
      t.string :name
      t.string :bio
      t.timestamps
    end

    # create candidates table
    create_table :candidates, id: :uuid do |t|
      t.string :name
      t.string :from
      t.integer :years_exp
      t.boolean :incumbent
      t.integer :years_in_current_office
      t.string :current_office
      t.string :bio
      t.integer :age
      t.references :personal_party, type: :uuid, foreign_key: { to_table: :parties }
      t.references :running_party, type: :uuid, foreign_key: { to_table: :parties }
      t.timestamps
    end

    # create candidate_issues table
    create_table :candidate_issues, id: :uuid do |t|
      t.references :issue, type: :uuid, foreign_key: true
      t.references :candidate, type: :uuid, foreign_key: true
      t.integer :score
      t.timestamps
    end
  end
end
