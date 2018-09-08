require "pry"

def game_hash
  game_hash = {
    :home =>{
      :team_name => 'Brooklyn Nets',
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5 
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    }, 
    
    :away =>{
      :team_name => 'Charlotte Hornets',
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
        }
    }
    }
end

def num_points_scored(name)
  player_points = []
  game_hash.each do |h_or_a, individual_team_info|
    individual_team_info.each do |tcp, stats|
      if tcp == :players && stats.include?(name)
        player_points << game_hash[h_or_a][:players][name][:points]
      end
    end
  end
  player_points[0]
end

def shoe_size(name)
  player_shoe_size = []
  game_hash.each do |h_or_a, individual_team_info|
    individual_team_info.each do |tcp, stats|
      if tcp == :players && stats.include?(name)
        player_shoe_size << game_hash[h_or_a][:players][name][:shoe]
      end
    end
  end
  player_shoe_size[0]
end

def team_colors(team_name)
  colors = []
  game_hash.each do |h_or_a, individual_team_info|
    individual_team_info.each do |tcp, stats|
      if tcp == :team_name && game_hash[h_or_a][:team_name] == team_name
        colors << game_hash[h_or_a][:colors]
      end
    end
  end
  colors.flatten
end

def team_names
  game_hash.collect do |h_or_a, individual_team_info|
    game_hash[h_or_a][:team_name]
  end
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |h_or_a, individual_team_info|
    individual_team_info.collect do |tcp, stats|
      if tcp == :team_name && game_hash[h_or_a][:team_name] == team_name
          game_hash[h_or_a][:players].collect do |names, p_stats|
          jersey_numbers << game_hash[h_or_a][:players][names][:number]
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
player_info = {} 
  game_hash.each do |h_or_a, individual_team_info|
    individual_team_info. each do |tcp, stats|
      if tcp == :players && stats.include?(name)
      player_info = game_hash[h_or_a][:players][name]
      end
    end
  end
  player_info
end

def big_shoe_rebounds
  check_shoe = nil
  reb = nil
  game_hash.each do |h_or_a, individual_team_info|
    individual_team_info.each do |tcp, stats|
      if tcp == :players
        stats.each do |name, player_stats|
        shoe_size = player_stats[:shoe]
          if check_shoe == nil || check_shoe < shoe_size
            check_shoe = shoe_size
            reb = player_stats[:rebounds]
          end
        end
      end
    end
  end
  reb
end









