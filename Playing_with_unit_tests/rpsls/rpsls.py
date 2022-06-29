# This is a module - ie: a python file with stuff linked to it

# round - best of 3 games

# referee --> 2inputs --> who wins

# rpsls --> referee

from enum import Enum
from random import choice

class Hand(Enum):
	'''The rules: "Scissors cuts paper, paper covers rock, rock crushes lizard, lizard poisons Spock, 
	Spock smashes scissors, scissors decapitates lizard, lizard eats paper, paper disproves Spock, 
	Spock vaporizes rock, and as it always has, rock crushes scissors."'''
	


	SCISSORS = 1
	PAPER = 2
	ROCK = 3
	LIZARD = 4
	SPOCK = 5


def rpsls() -> Hand:
	hand = choice(list(Hand))
	
	return hand



def referee(hand1:Hand, hand2:Hand) -> str:

	if hand1 == hand2:
		print("Rematch!")


	# what beats what

	'lizard eats paper'
	'lizard poisons Spock'
	'paper covers rock'
	'paper disproves Spock'
	'rock crushes lizard'
	'rock crushes scissors'
	'Scissors cuts paper'
	'scissors decapitates lizard'
	'Spock smashes scissors'
	'Spock vaporizes rock'

	# who beats who



def game(watch=True):
	# options = watch, play

	hand1 = rpsls()

	if watch:
		hand2 = rpsls()
	else:
		hand2 = input("Select (rock, paper, scissors, lizard, Spock): ")

	winner = referee(hand1, hand2)
	print("Thanks for playing!")


	return winner
