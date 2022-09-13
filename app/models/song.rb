class Song < ApplicationRecord
  belongs_to :artist
  has_many :downloads, dependent: :destroy
  has_many :artists, through: :downloads # , foreign_key: 'artist_id'

  scope :sorted_by_downloads, -> { order(downloads_count: :desc) }

  def self.top(days, count)
    where(created_at: (Time.now - days.day)..Time.now).sorted_by_downloads.last(count)
  end
end
