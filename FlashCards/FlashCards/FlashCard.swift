//
//  FlashCard.swift
//  FlashCards
//
//  Created by Tyler Bernth on 3/31/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//
import Foundation
class FlashCard{
    let frontSide: String     //Front side of flash card
    let backSide:  String     //Back side of flash card
    var correct:   Bool!      //Answer was Correct?
    
    init(front: String, back: String, correct: Bool!){ //Constructor
        self.frontSide = front;
        self.backSide  = back;
        self.correct   = correct
    }
}