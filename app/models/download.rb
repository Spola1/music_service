class Download < ApplicationRecord
  belongs_to :artist
  belongs_to :song, counter_cache: true

#  after_create :update_song_download_count

#  private

#  def update_song_download_count
#    song.increment!(:downloads_count, 1)
#  end
end
