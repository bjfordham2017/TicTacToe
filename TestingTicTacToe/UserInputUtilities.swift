//
//  UserInputUtilities.swift
//  TestingTicTacToe
//
//  Created by Brent Fordham on 5/5/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation

func getStringFromUser(prompt optionalPrompt: String?, failureMessage: String, allowEmptyString: Bool) -> String {
    var optionalValue: String? = nil
    
    while optionalValue == nil {
        if let prompt = optionalPrompt {
            print(prompt)
        }
        
        optionalValue = readLine(strippingNewline: true)
        
        if let value = optionalValue {
            if allowEmptyString == false && value.isEmpty {
                print(failureMessage)
                optionalValue = nil
            } else {
                return value
            }
        }
        
    }
    
    fatalError()
}


func getIntFromUser(prompt: String?, failureMessage: String, predicate: (Int) -> Bool) -> Int {
    
    var integer: Int? = nil
    
    while integer == nil {
        if let thePrompt = prompt {
            print(thePrompt)
        }
        
        integer = Int(getStringFromUser(prompt: nil, failureMessage: failureMessage, allowEmptyString: false))
        
        if let unwrapped = integer,
            predicate(unwrapped) {
            return unwrapped
        } else {
            print(failureMessage)
            integer = nil
        }
    }
    
    return integer!
}



func getChoiceFromUser(prompt: String, choices: [PlayPosition]) -> PlayPosition {
    guard choices.isEmpty == false else {
        fatalError("choices must not be empty")
    }
    
    guard choices.count > 1 else {
        return choices.first!
    }
    
    var index = 1
    var newPrompt = prompt
    for choice in choices {
        newPrompt.append("    Enter \(index) for \(choice)\n")
        index += 1
    }
    
    let count = choices.count
    let predicate: (Int) -> Bool = { input in
        (input >= 1) && (input <=  count)
    }
    
    print(newPrompt)
    
    let selectedIndex: Int = getIntFromUser(prompt: nil, failureMessage: "Not a valid choice. \n\(newPrompt)", predicate: predicate)
    
    return choices[selectedIndex - 1]
}
