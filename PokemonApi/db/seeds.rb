# frozen_string_literal: true

require 'faker'
require 'factory_bot_rails'

def pokemons_list
  response = Faraday.get 'https://pokeapi.co/api/v2/pokemon/'
  pokemon_url_list = JSON.parse(response.body)

  pokemon_url_list['results'].each do |t|
    response = Faraday.get t['url']
    pokemon = JSON.parse(response.body)
    Pokemon.create!(name: pokemon['name'], p_type: pokemon['types'][0]['type']['name'], exp: pokemon['base_experience'])
  end
end

# response = Faraday.get pokemon_parsed['results'][0]['url']
# pokemon = JSON.parse(response.body)
# Pokemon.create!(name: pokemon['name'], p_type: pokemon['types'][0]['type']['name'], exp: pokemon['base_experience'])

def moves_list
  response = Faraday.get 'https://pokeapi.co/api/v2/move/'
  move_url_list = JSON.parse(response.body)

  @moves = []
  move_url_list['results'].each do |t|
    response = Faraday.get t['url']
    move = JSON.parse(response.body)
    @moves << move
  end
end

def assign_moves(pokemon, nb_moves)
  nb_moves.times do
    move = @moves.sample
    Move.create!(name: move['name'], damage: rand(0..100), pokemon: pokemon)
  end
end

def randomize_moves
  Pokemon.all.each do |t|
    nb_moves = rand(1..3)
    assign_moves(t, nb_moves)
  end
end

pokemons_list
moves_list
randomize_moves
