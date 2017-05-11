//
//  SymbolandSpaceTypes.swift
//  TestingTicTacToe
//
//  Created by Brent Fordham on 5/5/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation


enum Symbol : CustomStringConvertible {
    case x
    case o
    case empty
    
    var description: String {
        switch self {
        case .x:
            return "X"
        case .o:
            return "O"
        case .empty:
            return " "
        }
    }
    
}

enum PlayPosition : CustomStringConvertible {
    case topRight
    case topCenter
    case topLeft
    case middleRight
    case middleCenter
    case middleLeft
    case bottomRight
    case bottomCenter
    case bottomLeft
    
    var description: String {
        switch self {
        case .topRight:
            return "Top Right"
        case .topLeft:
            return "Top Left"
        case .topCenter:
            return "Top Center"
        case .middleRight:
            return "Middle Right"
        case .middleCenter:
            return "Middle Center"
        case .middleLeft:
            return "Middle Left"
        case .bottomRight:
            return "Bottom Right"
        case .bottomCenter:
            return "Bottom Center"
        case .bottomLeft:
            return "Bottom Left"
        }
    }

}
