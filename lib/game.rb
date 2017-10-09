class Game

  def generate_grid(grid_size)
    alphabet_array = [*('A'..'Z')]
    grid = []
    grid_size.times do
      grid << alphabet_array.sample
    end
    grid
  end

  def run_game(attempt, grid, start_time, end_time)
    raise #CONTINUE HERE
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)
    attempt_letters = attempt.upcase.split('')
    dictionary_check = in_dictionary?(attempt, user)
    grid_check = in_grid?(attempt_letters, grid)
    grid_check_alphabets = enough_in_grid?(attempt_letters, grid)
    if dictionary_check && grid_check && grid_check_alphabets
      duration = end_time - start_time
      score = user['length'] / duration
      { score: score, message: 'well done' }
    elsif dictionary_check && grid_check && grid_check_alphabets == false || dictionary_check && grid_check == false
      no_score('not in the grid')
    else
      no_score('not an english word')
    end
  end

  def in_dictionary?(attempt, user)
    user['found'] == true
  end

  def in_grid?(attempt_letters, grid)
    attempt_letters.all? { |letter| grid.include? letter }
  end

  def enough_in_grid?(attempt_letters, grid)
    attempt_letters & grid == attempt_letters
  end

  def no_score(message)
    { score: 0, message: message }
  end



end



















# ORIGINALS

# require_relative "longest_word"

# puts "******** Welcome to the longest word-game!********"
# puts "Here is your grid:"
# grid = generate_grid(9)
# puts grid.join(" ")
# puts "*****************************************************"

# puts "What's your best shot?"
# start_time = Time.now
# attempt = gets.chomp
# end_time = Time.now

# puts "******** Now your result ********"

# result = run_game(attempt, grid, start_time, end_time)

# puts "Your word: #{attempt}"
# puts "Time Taken to answer: #{result[:time]}"
# puts "Your score: #{result[:score]}"
# puts "Message: #{result[:message]}"

# puts "*****************************************************"




# def generate_grid(grid_size)
#   alphabet_array = [*('A'..'Z')]
#   grid = []
#   grid_size.times do
#     grid << alphabet_array.sample
#   end
#   grid
# end

# def run_game(attempt, grid, start_time, end_time)
#   url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
#   user_serialized = open(url).read
#   user = JSON.parse(user_serialized)
#   attempt_letters = attempt.upcase.split('')
#   dictionary_check = in_dictionary?(attempt, user)
#   grid_check = in_grid?(attempt_letters, grid)
#   grid_check_alphabets = enough_in_grid?(attempt_letters, grid)
#   if dictionary_check && grid_check && grid_check_alphabets
#     duration = end_time - start_time
#     score = user['length'] / duration
#     { score: score, message: 'well done' }
#   elsif dictionary_check && grid_check && grid_check_alphabets == false || dictionary_check && grid_check == false
#     no_score('not in the grid')
#   else
#     no_score('not an english word')
#   end
# end

# def in_dictionary?(attempt, user)
#   user['found'] == true
# end

# def in_grid?(attempt_letters, grid)
#   attempt_letters.all? { |letter| grid.include? letter }
# end

# def enough_in_grid?(attempt_letters, grid)
#   attempt_letters & grid == attempt_letters
# end

# def no_score(message)
#   { score: 0, message: message }
# end