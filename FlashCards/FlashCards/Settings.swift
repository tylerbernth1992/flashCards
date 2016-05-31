//
//  Settings.swift
//  FlashCards
//
//  Created by Tyler Bernth on 4/20/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import Foundation

class Settings{
    var numQuestions: Int
    var timeLimit: Int
    
    init(){//numQuestions: Int, timeLimit: Int){
        self.numQuestions = 25
        self.timeLimit = 2
    }
    
}