class Entry < ApplicationRecord
  has_one_attached :image


  def self.permit_params
    [:name, :description, :activity_type, :mood_scale, :link, :date, :time, :image]
  end
end

  
