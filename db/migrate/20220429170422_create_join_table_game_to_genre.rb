class CreateJoinTableGameToGenre < ActiveRecord::Migration[7.0]
  def change
    create_join_table :games, :genres do |t|
      # t.index [:game_id, :genre_id]
      # t.index [:genre_id, :game_id]
    end
  end
end
