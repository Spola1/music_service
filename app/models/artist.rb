class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :downloads, dependent: :destroy
  has_many :songs, through: :downloads # , foreign_key: 'song_id'

  def songs
    Song.all.where(artist_id: id).order(:title)
  end

  def songs_top
    Song.all.where(artist_id: id).order(downloads_count: :desc)
  end

  def total
    Song.all.where(artist_id: id).map { |song| song.downloads_count }.sum
  end

  def self.top(letter, count)
    where("name LIKE ?", "#{letter}%").sort_by { |artist| artist.total }.reverse!.first(count)
  end
end
