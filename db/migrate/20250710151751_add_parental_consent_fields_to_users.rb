class AddParentalConsentFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :parent_email, :string
    add_column :users, :parental_consent, :boolean, default: false
  end
end
