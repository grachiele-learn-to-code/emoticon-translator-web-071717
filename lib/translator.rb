# require modules here
require "yaml"

def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)

  dict = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }

  emoticons.each do |key, value|
    dict['get_emoticon'][value[0]] = value[1]
    dict['get_meaning'][value[1]] = key
  end
  dict
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  if emoticons["get_emoticon"].include?(emoticon)
    emoticons["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  if emoticons["get_meaning"].include?(emoticon)
    emoticons["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
