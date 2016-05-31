//
//  ViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 3/27/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBAction func tappedScreen(sender: UITapGestureRecognizer) {
        print("Hello")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*self.number1.text = "3"
        self.number2.text = "5"
        self.operation.text = "+"
        
        self.number1.font = UIFont(name: "DK Crayon Crumble", size: 200)
        self.number2.font = UIFont(name: "DK Crayon Crumble", size: 200)
        self.operation.font = UIFont(name: "DK Crayon Crumble", size: 200)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

