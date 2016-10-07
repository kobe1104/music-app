class Band < ActiveRecord::Base
  validates :name, presence: true

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :albums,
    class_name: "Album",
    foreign_key: :band_id,
    primary_key: :id
  )


end
