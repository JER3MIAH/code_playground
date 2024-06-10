"""Rock paper scissors game"""

import random

rand = random.randint(1, 5)
game_options = ['rock', 'paper', 'scissors']
myComputerChoice = random.choice(game_options)


def choice():
    """This function formats and returns the user's choice
    """
    try:
        ch = int(input('rock(1), paper(2), or scissors(3)? '))
        return ch
    except ValueError:
        return 0


def set_user_choice(user_input):
    """This function selects rock, paper or scissors for the user
    """
    if user_input == 1:
        return 'rock'
    elif user_input == 2:
        return 'paper'
    else:
        return 'scissors'


def check_choices(user_choice, computer_choice):
    """This function checks user and computer choices to determine the winner
    """
    print(f'your pick: {user_choice}, computer\'s pick: {computer_choice}')
    if user_choice == computer_choice:
        print('A tie!!')
    elif (user_choice == game_options[0] and computer_choice == game_options[1]) or\
        ((user_choice == game_options[1] and computer_choice == game_options[2])) or\
            ((user_choice == game_options[2] and computer_choice == game_options[0])):
        print('You lost!')
        return False
    elif (user_choice == game_options[0] and computer_choice == game_options[2]) or\
        ((user_choice == game_options[1] and computer_choice == game_options[0])) or\
            ((user_choice == game_options[2] and computer_choice == game_options[1])):
        print('You Win!')
        return True


def start_game(user_input, computer_choice):
    """This function starts the game
    """
    game_on = True
    print('Starting game...')

    while game_on:
        if not isinstance(user_input, int) or user_input not in (1, 2, 3):
            print('Enter 1, 2 or 3')
            user_input = choice()
        else:
            user_choice = set_user_choice(user_input)
            check_choices(user_choice, computer_choice)
            game_on = False


start_game(choice(), myComputerChoice)
