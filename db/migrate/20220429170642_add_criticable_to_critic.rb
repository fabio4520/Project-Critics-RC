class AddCriticableToCritic < ActiveRecord::Migration[7.0]
  def change
    add_reference :critics, :criticable, polymorphic: true, index: true
  end
end
