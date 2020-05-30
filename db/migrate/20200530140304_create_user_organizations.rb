class CreateUserOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_organizations do |t|
      t.belongs_to :user
      t.belongs_to :organization
      t.timestamps
    end
  end
end
