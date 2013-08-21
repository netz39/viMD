class Player
	def initialize()
		@old_health = 20
		@stage = 0
	end

	def play_turn(warrior)
		if @stage == 0 
			if warrior.feel.empty?
				warrior.walk!
			else
				@stage += 1
				puts @stage
			end
		end
		if @stage == 1
			if warrior.feel.enemy?
				warrior.attack!
			else
				@stage += 1
				puts @stage
			end
		end

		if @stage == 2
			puts warrior.feel :backward
			if warrior.feel(:backward).empty?
				warrior.walk! :backward
			else
				@stage += 1
				puts @stage
			end
		end
		if @stage == 3
			if warrior.feel(:backward).captive?
				warrior.rescue! :backward
			elsif warrior.feel(:backward).empty? and warrior.health < 19
				warrior.rest!
			else
				@stage += 1
				puts @stage
			end
		end
		if @stage == 4
			if warrior.feel.empty?
				warrior.walk!
			elsif warrior.feel.enemy?
				warrior.attack!
			end
		end

		@old_health = warrior.health
	end
end
