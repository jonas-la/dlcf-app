class AddLogoAndCharterToOrgInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :orginfos, :logo_path, :string
    add_column :orginfos, :charter_path, :string
  end
end
