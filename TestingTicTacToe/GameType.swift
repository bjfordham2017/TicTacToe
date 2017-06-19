//
//  GameType.swift
//  TestingTicTacToe
//
//  Created by Brent Fordham on 5/5/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation

struct Game {
    let playerX: Player
    let playerO: Player
    
    var board: [PlayPosition: Symbol]
    
    var xPositions: Set<PlayPosition> {
        var output: Set<PlayPosition> = []
        for (key, value) in board {
            if value == .x {
                output.insert(key)
            }
        }
        return output
    }
    
    var oPositions: Set<PlayPosition> {
        var output: Set<PlayPosition> = []
        for (key, value) in board {
            if value == .o {
                output.insert(key)
            }
        }
        return output
    }
    
    var openPositions: [PlayPosition] {
        var output: [PlayPosition] = []
        for (key, value) in board {
            if value == .empty {
                output.append(key)
            }
        }
        
        output.sort(by: {$0.rawValue < $1.rawValue})
        return output
    }
    
    var boardIsFull: Bool {
        return openPositions.isEmpty
    }
    
    
    static let winningPositions: [Set<PlayPosition>] = [[.topRight, .topCenter, .topLeft],
                                                        [.middleRight, .middleCenter, .middleLeft],
                                                        [.bottomRight, .bottomCenter, .bottomLeft],
                                                        [.topRight, .middleRight, .bottomRight],
                                                        [.topCenter, .middleCenter, .bottomCenter],
                                                        [.topLeft, .middleLeft, .bottomLeft],
                                                        [.topRight, .middleCenter, .bottomLeft],
                                                        [.bottomRight, .middleCenter, .topLeft]]
    
    var xWins: Bool {
        var winCombo: [Set<PlayPosition>] = []
        for element in Game.winningPositions {
            if xPositions.isSuperset(of: element) {
                winCombo.append(element)
            }
        }
        return !winCombo.isEmpty
    }
    
    var oWins: Bool {
        var winCombo: [Set<PlayPosition>] = []
        for element in Game.winningPositions {
            if oPositions.isSuperset(of: element) {
                winCombo.append(element)
            }
        }
        return !winCombo.isEmpty
    }
    
    
    
    init(playerX: Player, playerO: Player) {
        self.playerX = playerX
        self.playerO = playerO
        self.board = [.topRight: .empty,
                      .topCenter: .empty,
                      .topLeft: .empty,
                      .middleRight: .empty,
                      .middleCenter: .empty,
                      .middleLeft: .empty,
                      .bottomRight: .empty,
                      .bottomCenter: .empty,
                      .bottomLeft: .empty]
    }
    
    func printBoard() {
        print("     |   |     ")
        print("   \(board[.topLeft]!) | \(board[.topCenter]!) | \(board[.topRight]!)   ")
        print("-----+---+-----")
        print("   \(board[.middleLeft]!) | \(board[.middleCenter]!) | \(board[.middleRight]!)   ")
        print("-----+---+-----")
        print("   \(board[.bottomLeft]!) | \(board[.bottomCenter]!) | \(board[.bottomRight]!)   ")
        print("     |   |     ")
    }
    
    mutating func play() {
        var round: Int = 1
        repeat {
            round += 1
            if round % 2 == 0 {
                printBoard()
                let xChoice = getChoiceFromUser(prompt: "Where would you like to play, \(playerX.name)?", choices: openPositions)
                board[xChoice] = .x
            } else {
                printBoard()
                let oChoice = getChoiceFromUser(prompt: "Where would you like to play, \(playerO.name)?", choices: openPositions)
                board[oChoice] = .o
            }
        } while boardIsFull == false && xWins == false && oWins == false
        
        switch (boardIsFull, xWins, oWins) {
        case (true, false, false):
            printBoard()
            print("The game is a draw.")
        case (false, true, false):
            printBoard()
            print("X wins!  Congradulations, \(playerX.name).")
        case (false, false, true):
            printBoard()
            print("O wins!, Congradulations, \(playerO.name)")
        case (true, true, false):
            printBoard()
            print("X wins!  Congradulations, \(playerX.name).")
        case (true, false, true):
            printBoard()
            print("O wins!, Congradulations, \(playerO.name)")
        case (false, false, false):
            printBoard()
            print("The game continues")
        case (false, true, true):
            printBoard()
            print("You're both cheating.")
        case (true, true, true):
            printBoard()
            print("Both players cannot win.")
        }
    }
    
}
