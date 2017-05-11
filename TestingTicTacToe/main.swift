//
//  main.swift
//  TestingTicTacToe
//
//  Created by Brent Fordham on 5/5/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation

print("Hello.")

print("Welcome to Tic-Tac-Toe.")

let firstPlayerName = getStringFromUser(prompt: "Who wants to play as X?", failureMessage: "Please enter your name.", allowEmptyString: false)

let firstPlayer = Player(name: firstPlayerName)

let secondPlayerName = getStringFromUser(prompt: "And who wants to play as O?", failureMessage: "Please enter your name.", allowEmptyString: false)

let secondPlayer = Player(name: secondPlayerName)

var newGame = Game(playerX: firstPlayer, playerO: secondPlayer)

print("Okay, let's play!")

newGame.play()



