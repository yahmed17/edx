class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    puts "hello"

    raise NoSuchStrategyError,"Strategy must be one of R,P,S"  unless player1[1] =~ /^[RPS]$/  &&  player2[1] =~ /^[RPS]/
    return player1 if (player1[1] == player2[1])
    #Player 1 Rock
    return player1 if (player1[1] == "R" && player2[1] == "S" )
    return player2 if (player1[1] == "R" && player2[1] == "P" )
    #Player 1 Paper
    return player2 if (player1[1] == "P" && player2[1] == "S" )
    return player1 if (player1[1] == "P" && player2[1] == "R" )
    #Player 1 Scissor
    return player2 if (player1[1] == "S" && player2[1] == "R" )
    return player1 if (player1[1] == "S" && player2[1] == "P" )


  end

  def self.tournament_winner(tournament)
    if tournament[0][0].kind_of?(String) then
    self.winner(tournament[0],tournament[1])
      else
      #puts "*************** tournament_winner"
        p1 = self.tournament_winner(tournament[0])
        p2 = self.tournament_winner(tournament[1])
        return self.winner(p1,p2)

        #puts "tournament_winner"
      end
  end

end
