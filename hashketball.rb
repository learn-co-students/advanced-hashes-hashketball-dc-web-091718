# Write your code here!
require 'pry'
$data = {
   home: {
      team_name: "Brooklyn Nets",
      :colors => ["Black", "White"],
      players: {
          "Alan Anderson" =>{
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          "Reggie Evans" =>{
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          "Brook Lopez" =>{
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          "Mason Plumlee" =>{
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          "Jason Terry" =>{
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
    away:  {
      team_name: "Charlotte Hornets" ,
      :colors  => ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" =>{
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" =>{
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" =>{
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" =>{
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" =>{
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



def game_hash
    $data
end

def num_points_scored(player)

  $data.each do |location, team|
    team[:players].each do |name, stats|
      if name == player
        return stats[:points]
      end
    end
  end

end

def team_colors(team)

  $data.each do |key, value|
    if value[:team_name] == team
       return value[:colors]
    end
  end
end

def team_names
  [] << $data[:home][:team_name] <<$data[:away][:team_name]
end

def shoe_size(player)

  $data.each do |location, team|
    team[:players].each do |name, stats|
      if name == player
        return stats[:shoe]
      end
    end
  end

end
def player_stats(player)

  $data.each do |location, team|
    team[:players].each do |name, stats|
      if name == player
        return stats
      end
    end
  end
end

def player_numbers(team_name)
  arr = []
    $data.each do |location, team|
      if team[:team_name] == team_name
        team[:players].each do |name, stats|
          arr<<stats[:number]
        end
      end
    end
  arr
end

def big_shoe_rebounds
player = nil
  $data.each do |location, team|
      team[:players].each do |name, stats|
        player == nil ? player = name : (stats[:shoe] >= player_stats(player)[:shoe]) ? player = name : player = player
    end
  end
  player_stats(player)[:rebounds]

end

def player_with_longest_name
  player = nil
    $data.each do |location, team|
        team[:players].each do |name, stats|
          player == nil ? player = name : (name.length >= player.length) ? player = name : player = player
      end
    end
    player
end

def long_name_steals_a_ton?

  player = player_with_longest_name
    $data.each do |location, team|
        team[:players].each do |name, stats|
          stats[:steals] >= player_stats(player)[:steals] ? player = name : player = player
      end
    end
  player == player_with_longest_name

end

def most_points_scored
  player = nil
    $data.each do |location, team|
        team[:players].each do |name, stats|
          player == nil ? player = name : (stats[:points] > player_stats(player)[:points]) ? player = name : player = player
      end
    end
    player
end

def winning_team

  total = {}
    $data.each do |location, team|
        total[location]={scored: 0}
        team[:players].each do |name, stats|
           total[location][:scored] += stats[:points]
        end
      end

  total[:home][:scored]>total[:away][:scored] ? $data[:home][:team_name] : $data[:away][:team_name]

end
