require 'pry'

def game_hash
   {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def home_team?(player)
  game_hash[:home][:players].keys.include?(player) ? true : false
end

def home?(team)
  game_hash[:home][:team_name] == team ? true : false
end

def num_points_scored(player)
  home_team?(player) ? game_hash[:home][:players][player][:points] : game_hash[:away][:players][player][:points]
end

def shoe_size(player)
  home_team?(player) ? game_hash[:home][:players][player][:shoe] : game_hash[:away][:players][player][:shoe]
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  if home?(team_name)
    game_hash[:home][:players].map do |name, stats|
      stats[:number]
    end
  else
    game_hash[:away][:players].map do |name, stats|
      stats[:number]
    end
  end
end

def player_stats(player)
  if home_team?(player)
    game_hash[:home][:players][player]
  else
    game_hash[:away][:players][player]
  end
end

def player_hash
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  biggest_shoe_player_rebounds = nil
  
  player_hash.each do |player, stats|
    if stats[:shoe] > biggest_shoe_size
      biggest_shoe_size = stats[:shoe]
      biggest_shoe_player_rebounds = stats[:rebounds]
    end
  end

  return biggest_shoe_player_rebounds
end

def most_points_scored
  most_points_scored = {name: "", points: 0}
  
  player_hash.each do |name, stats|
    if stats[:points] > most_points_scored[:points]
      most_points_scored[:name] = name
      most_points_scored[:points] = stats[:points]
    end
  end
  
  most_points_scored[:name]
end

def team_points(player_hash)
  total = 0
  
  player_hash.each do |name, stats|
    total += stats[:points]
  end
  
  total
end

def winning_team
  home_points = team_points(game_hash[:home][:players])
  away_points = team_points(game_hash[:away][:players])
  
  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = ""
  
  player_hash.each do |name, stats|
    name.length > longest_name.length ? longest_name = name : nil
  end
  
  longest_name
end

def long_name_steals_a_ton?
  most_steals = {name: "", steals: 0}
  
  player_hash.each do |name, stats|
    if stats[:steals] > most_steals[:steals]
      most_steals[:name] = name
      most_steals[:steals] = stats[:steals]
    end
  end
  
  most_steals[:name] == player_with_longest_name
end