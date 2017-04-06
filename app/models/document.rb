class Document < ApplicationRecord
    default_scope { order(created_at: :desc) }
    belongs_to :teacher
end
