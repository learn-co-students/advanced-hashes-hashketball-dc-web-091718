require "pry"

def game_hash
  game_hash = {
    :home => { :team_name => 'Brooklyn Nets',
               :colors => ['Black', 'White'],
               :players => {
                          'Alan Anderson'=> {:number => '0',
                                              :shoe => '16',
                                              :points => '22',
                                              :rebounds => '12',
                                              :assists => '12',
                                              :steals => '3',
                                              :blocks => '1',
                                              :slam_dunks => '1'},
                            'Reggie Evans' => {:number => '30',
                                              :shoe => '14',
                                              :points => '12',
                                              :rebounds => '12',
                                              :assists => '12',
                                              :steals => '12',
                                              :blocks => '12',
                                              :slam_dunks => '7'},
                            'Brook Lopez' =>  {:number => '11',
                                              :shoe => '17',
                                              :points => '17',
                                              :rebounds => '19',
                                              :assists => '10',
                                              :steals => '3',
                                              :blocks => '1',
                                              :slam_dunks => '15'},
                          'Mason Plumlee' => { :number => '1',
                                              :shoe => '19',
                                              :points => '26',
                                              :rebounds => '12',
                                              :assists => '6',
                                              :steals => '3',
                                              :blocks => '8',
                                              :slam_dunks => '5'},
                            'Jason Terry' =>  {:number => '31',
                                              :shoe => '15',
                                              :points => '19',
                                              :rebounds => '2',
                                              :assists => '2',
                                              :steals => '4',
                                              :blocks => '11',
                                              :slam_dunks => '1'}}},
    :away => { :team_name => 'Charlotte Hornets',
               :colors => ['Turquoise', 'Purple'],
               :players => {
                          'Jeff Adrien'=>     {:number => '4',
                                              :shoe => '18',
                                              :points => '10',
                                              :rebounds => '1',
                                              :assists => '1',
                                              :steals => '2',
                                              :blocks => '7',
                                              :slam_dunks => '2'},
                          'Bismak Biyombo' => {:number => '0',
                                              :shoe => '16',
                                              :points => '12',
                                              :rebounds => '4',
                                              :assists => '7',
                                              :steals => '7',
                                              :blocks => '15',
                                              :slam_dunks => '10'},
                            'DeSagna Diop' => {:number => '2',
                                              :shoe => '14',
                                              :points => '24',
                                              :rebounds => '12',
                                              :assists => '12',
                                              :steals => '4',
                                              :blocks => '5',
                                              :slam_dunks => '5'},
                          'Ben Gordon' =>   { :number => '8',
                                              :shoe => '15',
                                              :points => '33',
                                              :rebounds => '3',
                                              :assists => '2',
                                              :steals => '1',
                                              :blocks => '1',
                                              :slam_dunks => '0'},
                        'Brendan Haywood' =>  {:number => '33',
                                              :shoe => '15',
                                              :points => '6',
                                              :rebounds => '12',
                                              :assists => '12',
                                              :steals => '22',
                                              :blocks => '5',
                                              :slam_dunks => '12'}}},
  }
  
end 

def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_data|
          if player_name == player
            player_data.collect do |stat, stat_value|
              if stat == :points
                stat_value = stat_value.to_i
                return stat_value
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_data|
          if player_name == player
            player_data.collect do |stat, stat_value|
              if stat == :shoe
                stat_value = stat_value.to_i
                return stat_value
              end
            end
          end
        end
      end
    end
  end
end


def team_colors(team)
  game_hash.each do |location, team_data|
    values = []
    values = team_data.values
    if values.include? team
      team_data.each do |attribute, data|
        if attribute == :colors
          return data
        end 
    end
  end 
end 
end

def team_names
  team_name_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_name_array << data
      end
    end
  end
  return team_name_array
end

def player_numbers(team_name)
  number_list = []
    game_hash.each do |location, team_data|
    values = []
    values = team_data.values
    if values.include? team_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, num_stats|
            num_stats.each do |stat, num|
              if stat == :number
                number_list << num.to_i
              end 
            end 
          end 
        end 
      end 
    end
  end
  return number_list  
end 

def player_stats(player)
  new_hash = {}
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_name, num_stats|
            if player_name == player
              num_stats.collect do |key, value|
                new_hash[key] = value.to_i
              end
            end 
          end 
        end 
      end
  end
  return new_hash
end 

def find_biggest_shoe
  shoe_sizes = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_data|
            player_data.collect do |stat, stat_value|
              if stat == :shoe
                shoe_sizes << stat_value
              end
            end
        end
      end
    end
  end 
  shoe_sizes = shoe_sizes.sort
  shoe_sizes = shoe_sizes.reverse
  return shoe_sizes
end 

def big_shoe_rebounds
  shoe_sizes = find_biggest_shoe
  biggest_shoe_size = shoe_sizes[0]
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_data|
            player_data.each do |stat, stat_value|
              if stat == :shoe && stat_value == biggest_shoe_size
                return player_data[:rebounds].to_i
              end
            end
        end
      end
    end
  end
end 


puts big_shoe_rebounds
  
  