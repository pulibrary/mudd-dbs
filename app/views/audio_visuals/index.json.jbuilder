json.array!(@audio_visuals) do |audio_visual|
  json.extract! audio_visual, :id, :item, :box, :topic, :title, :creator, :year, :format, :color, :duration, :copied, :notes, :id3, :index
  json.url audio_visual_url(audio_visual, format: :json)
end
