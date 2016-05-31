//
//  FinishedQuizViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 4/13/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit

class FinishedQuizViewController: UIViewController {
    
    var correct: Float!
    var total: Float!
    var settings: Settings!
    
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var numCorrect: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let correctInt:Int = Int(self.correct)
        let totalInt:Int = Int(self.total)
        
        var percent: Float
        if self.total != 0{
            percent = ( 100 * self.correct / self.total )
        }
        else{
            percent = 0
        }
        
        let percentInt = Int(round(percent))
        self.percent.text = "\(percentInt)%"
        self.numCorrect.text = "You answered \(correctInt)/\(totalInt) correctly!"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "home"{
            let svc = segue.destinationViewController as! HomePageViewController
            svc.settings = self.settings
        }
    }


}
