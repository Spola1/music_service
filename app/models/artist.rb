class Artist < ApplicationRecord
  has_many :songs
  has_many :downloads
  has_many :download_songs, through: :downloads, foreign_key: 'song_id'

  def songs
    Song.all.where(artist_id: id).order(:title)
  end

  def songs_top
    Song.all.where(artist_id: id).order(download_count: :desc)
  end

  def total
    Song.all.where(artist_id: id).map { |song| song.downloads_count }.sum
  end

  def self.top(letter, count)
    where("name LIKE ?", "#{letter}%").sort_by { |artist| artist.total }.reverse!.first(count)
  end
end
