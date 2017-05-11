//
//  PlayerType.swift
//  TestingTicTacToe
//
//  Created by Brent Fordham on 5/5/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation

struct Player : CustomStringConvertible {
    let name: String
    
    var description: String {
        return name
    }
}
