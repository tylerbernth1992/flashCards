//
//  Quiz.swift
//  FlashCards
//
//  Created by Tyler Bernth on 4/15/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import Foundation

class Quiz: NSObject, NSCoding{
    var numCorrect: Int
    var numTotal: Int
    var operation: String
    var date: String
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("quizzes")
    
    init(correct: Int, total: Int, op: String){ //Constructor
        self.numCorrect = correct
        self.numTotal = total
        self.operation = op
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        self.date = dateFormatter.stringFromDate(date)
        super.init()
    }
    
    init(correct: Int, total: Int, op: String, date: String){ //Constructor
        self.numCorrect = correct
        self.numTotal = total
        self.operation = op
        self.date = date
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeInteger(numCorrect, forKey: "Correct")
        aCoder.encodeInteger(numTotal, forKey: "Total")
        aCoder.encodeObject(operation, forKey: "Operation")
        aCoder.encodeObject(date, forKey: "Date")
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let correct = aDecoder.decodeIntegerForKey("Correct") 
        let total = aDecoder.decodeIntegerForKey("Total") 
        let operation = aDecoder.decodeObjectForKey("Operation") as! String
        let date = aDecoder.decodeObjectForKey("Date") as! String
        self.init(correct: correct, total: total, op: operation, date: date)
    }

}