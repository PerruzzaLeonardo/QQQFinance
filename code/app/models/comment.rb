class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :azione

    validates :azione_id,:commento,:user_id, presence: true
end
