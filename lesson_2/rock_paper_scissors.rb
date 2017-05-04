VALID_CHOICES = %w(rock paper scissors).freeze

def prompt(message)
  puts " => #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt('Its a tie!')
  end
end

loop do
  choice = ' '
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt('That is not a valid choice.')
  end

  computer_choice = %w(rock paper scissors).sample
  
  prompt("You chose: #{choice}; computer chose: #{computer_choice}")
  
  display_results(choice, computer_choice)

  prompt('Do you want to play again? (y/n)')
  answer = gets.chomp
  
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Good bye.')
