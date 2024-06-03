class ChangeUserIdToProfileIdInReviews < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reviews, :user, foreign_key: true
    add_reference :reviews, :profile, foreign_key: true
  end
end
