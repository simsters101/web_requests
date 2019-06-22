require "http"

puts "Enter words and I'll tell you their definitions, top examples, and pronounciations. Type in q when you are finished."
puts

while true
  input_word = gets.chomp
  puts
  if input_word == "q"
    break
  end
  definition_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")
  puts "Definition:"
  p definition_response.parse[1]["text"]
  puts

  top_example_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=")
  puts "Top Example:"
  puts top_example_response.parse["text"]
  puts

  pronounciation_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=")
  puts "pronunciation:"
  puts pronounciation_response.parse[0]["raw"]
  puts
  puts "Done."
  puts

  # audio_response = HTTP.get("https://api.wordnik.com/v4/word.json/happy/audio?useCanonical=false&limit=50&api_key=")
end