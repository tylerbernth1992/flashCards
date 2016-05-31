//
//  AdditionCards.swift
//  FlashCards
//
//  Created by Tyler Bernth on 3/31/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//
import Foundation

class Cards{
    var cards: [FlashCard]!
    var max: Int!
    let type: String!
    var day: NSCalendar!
    var time: NSDate!
    
    init(type: String, max: Int, var val1: Int, flag: String){
        self.cards = [FlashCard]()
        self.max = max
        self.type = type
        
        self.day = NSCalendar.currentCalendar()
        self.time = NSDate()
        
        if flag == "Q"{ //A Quiz was selected, so randomly generate the 2nd #
            if type == "Addition"{
                for var i = 0 ; i < max ; i = i + 1{
                    let val2 = Int(arc4random_uniform(12) + 1)
                    let backside = val1 + val2
                    
                    appendCards(val1, val2: val2, operation: "+", backSide: backside)
                    //let flashCard = FlashCard(front: "\(val1) + \(val2)", back: "\(backside)", correct: nil)
                    //cards.append(flashCard)
                }
            }
            else if type == "Subtraction"{
                let val1_temp = val1
                for var i = 0 ; i < max ; i = i + 1{
                    val1 = val1_temp
                    var val2 = Int(arc4random_uniform(12) + 1)
                
                    if val1 < val2{
                        val2 = val1_temp + val2
                        val1 = val2 - val1_temp
                        val2 = val2 - val1
                    }
                
                    let backside = val1 - val2
                  
                    appendCards(val1, val2: val2, operation: "-", backSide: backside)
                  //  let flashCard = FlashCard(front: "\(val1) - \(val2)", back: "\(backside)", correct: nil)
                  //  cards.append(flashCard)
                }
            }
            else if type == "Multiplication"{
                for var i = 0 ; i < max ; i = i + 1{
                    let val2 = Int(arc4random_uniform(12) + 1)
                    let backside = val1 * val2
                
                    appendCards(val1, val2: val2, operation:"x", backSide: backside)
                    //let flashCard = FlashCard(front: "\(val1) x \(val2)", back: "\(backside)", correct: nil)
                    //cards.append(flashCard)
                }
            }
            else if type == "Division"{ //Fix this problem...when clicking quiz for 12
                for var i = 0 ; i < max ; i = i + 1{
                    let val2 = Int(arc4random_uniform(12) + 1)
                    var finalVal1 = val1
                    finalVal1 = val1 * val2
                
                    let backside = finalVal1 / val1
                
                    appendCards(finalVal1, val2: val1, operation: "÷", backSide: backside)
                    //let flashCard = FlashCard(front: "\(finalVal1) ÷ \(val1)", back: "\(backside)", correct: nil)
                    //cards.append(flashCard)
                }
            }
        }
        else{ //Flash cards were chosen, get all values from 1-12 for the cards
            for var i = 1; i <= 12 ; i = i + 1{
                if type == "Addition"{
                    let backside = val1 + i
                    appendCards(val1, val2: i, operation: "+", backSide: backside)
                }
                else if type == "Subtraction"{
                    var finalVal1 = val1
                    var val2 = i
                    
                    if finalVal1 < val2{
                        val2 = finalVal1 + val2
                        finalVal1 = val2 - finalVal1
                        val2 = val2 - finalVal1
                    }
                    
                    let backside = finalVal1 - val2
                    
                    appendCards(finalVal1, val2: val2, operation: "-", backSide: backside)
                }
                else if type == "Multiplication"{
                    let backside = val1 * i
                    appendCards(val1, val2: i, operation: "x", backSide: backside)
                }
                else if type == "Division"{
                    let finalVal1 = val1 * i
                    let backside = finalVal1 / val1
                    appendCards(finalVal1, val2: val1, operation: "÷", backSide: backside)
                }
            }
            
        }
        cards.shuffleInPlace()
    } //End init cards

    func appendCards(val1: Int, val2: Int, operation:String, backSide: Int){
        let flashCard = FlashCard(front: "\(val1) \(operation) \(val2)", back: "\(backSide)", correct: nil)
        cards.append(flashCard)
    }
    
}