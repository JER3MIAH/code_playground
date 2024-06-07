import random

rand = random.randint(1, 5)
game_options = ['rock', 'paper', 'scissors']
myComputerChoice = random.choice(game_options)


def choice():
    try:
        ch = int(input('rock(1), paper(2), or scissors(3)? '))
        return ch
    except ValueError as e:
        return 0


def setUserChoice(userInput):
    if userInput == 1:
        return 'rock'
    elif userInput == 2:
        return 'paper'
    else:
        return 'scissors'


def checkChoices(userChoice, computerChoice):
    print(f'your pick: {userChoice}, computer\'s pick: {computerChoice}')
    if userChoice == computerChoice:
        print('A tie!!')
    elif (userChoice == game_options[0] and computerChoice == game_options[1]) or ((userChoice == game_options[1] and computerChoice == game_options[2])) or ((userChoice == game_options[2] and computerChoice == game_options[0])):
        print('You lost!')
        return False
    elif (userChoice == game_options[0] and computerChoice == game_options[2]) or ((userChoice == game_options[1] and computerChoice == game_options[0])) or ((userChoice == game_options[2] and computerChoice == game_options[1])):
        print('You Win!')
        return True


def startGame(userInput, computerChoice):
    gameOn = True
    print('Starting game...')

    while gameOn:
        if not isinstance(userInput, int) or userInput not in (1, 2, 3):
            print('Enter 1, 2 or 3')
            userInput = choice()
        else:
            userChoice = setUserChoice(userInput)
            checkChoices(userChoice, computerChoice)
            gameOn = False


startGame(choice(), myComputerChoice)
