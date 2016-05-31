//
//  Subject.swift
//  Flash Cards
//
//  Created by Tyler Bernth on 3/25/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit;

class Subject {
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    
    //MARK Initialization
    
    init(name: String, photo: UIImage? ){
        self.name = name
        self.photo = photo
    }
}
