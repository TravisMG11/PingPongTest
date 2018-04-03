class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :wins, foreign_key: :winner_id, class_name: 'Game'
  has_many :losses, foreign_key: :loser_id, class_name: 'Game'


end
