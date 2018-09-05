# Write your code here!

def make_player( number, shoe, points, rebounds, assists, steals, blocks, slam_dunks)
	stats = {
		number: number,
		shoe: shoe,
		points: points,
		rebounds: rebounds,
		assists: assists,
		steals: steals,
		blocks: blocks,
		slam_dunks: slam_dunks
	}
end

def make_team(team)
	players = {}
	i = 0
	while i < 5
		players[team[i]] = make_player(team[i+5], team[i+10], team[i+15], team[i+20], team[i+25], team[i+30], team[i+35], team[i+40])
		i += 1
	end
	players
end

def game_hash
	nets = ["Alan Anderson","Reggie Evans","Brook Lopez","Mason Plumlee","Jason Terry",0,30,11,1,31,16,14,17,19,15,22,12,17,26,19,12,12,19,12,2,12,12,10,6,2,3,12,3,3,4,1,12,1,8,11,1,7,15,5,1]
	hornets = ["Jeff Adrien","Bismak Biyombo","DeSagna Diop","Ben Gordon","Brendan Haywood",4,0,2,8,33,18,16,14,15,15,10,12,24,33,6,1,4,12,3,12,1,7,12,2,12,2,7,4,1,22,7,15,5,1,5,2,10,5,0,12]

	hash = {
		home: {
			team_name: "Brooklyn Nets", 
			colors: ["Black", "White"],
			:players => make_team(nets)

		},
		away: {
			team_name: "Charlotte Hornets", 
			colors: ["Turquoise","Purple"],
			:players => make_team(hornets)

		},
	}

end


def num_points_scored(name)
	game = game_hash
	game.each_value do|info|
		players = info[:players]

		if players.has_key?(name) 
			stats = players[name]
			return stats[:points]
		end
	end
end

def shoe_size(name)
	game = game_hash
	game.each_value do|info|
		players = info[:players]

		if players.has_key?(name) 
			stats = players[name]
			return stats[:shoe]
		end
	end
end

def team_colors(team_name)
	game = game_hash
	game.each_value do|info|
		if info[:team_name] == team_name
			return info[:colors]
		end
	end
end

def team_names
	teams = []
	game = game_hash
	game.each_value do|info|
		teams << info[:team_name]
	end
	teams
end

def player_numbers(team_name)
	numbers = []
	game = game_hash
	game.each_value do|info|
		if info[:team_name] == team_name
			players = info[:players]

			players.each_value do |stats|
				numbers << stats[:number]
			end
		end
	end
	numbers
end

def player_stats(name)
	game = game_hash
	game.each_value do|info|
		players = info[:players]
		if players.key?(name)
			return players[name]
		end
		
	end

end

def big_shoe_rebounds
	game = game_hash
	max_size = 0
	max_player_rebounds = 0
	game.each_value do|info|
		players = info[:players]
		players.each do |name, stats|
			if stats[:shoe] > max_size
				max_size = stats[:shoe]
				max_player_rebounds = stats[:rebounds]
			end
		end
	end
	max_player_rebounds

end











