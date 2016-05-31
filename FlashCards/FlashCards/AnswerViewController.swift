//
//  AnswerViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 3/31/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AnswerViewController: UIViewController {

    @IBOutlet weak var ad: GADBannerView!
    var index:Int!
    var cards: Cards!
    var settings: Settings!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // Create reference to our app delegate
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextCard(sender: UIButton) {
        if self.cards.max == self.index - 1{//return to home page because we finished all of the cards
            self.index = 0
            performSegueWithIdentifier("nextCard", sender: self)
        }
        else{
            performSegueWithIdentifier("nextCard", sender: self)
        }
    }
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.answer.text = self.cards.cards[self.index].backSide
        self.answer.font = UIFont(name: "Chalkboard SE", size: 175)
        
        self.ad.adUnitID = "ca-app-pub-5714389273534312/1065143786"
        self.ad.rootViewController = self
        let request = GADRequest()
        request.testDevices = ["3424be15d2aef58bdb2590f69346bf6d"]
        request.tagForChildDirectedTreatment(true)
        self.ad.loadRequest(request)
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
        if segue.identifier == "flipToEquation"{
            let svc = segue.destinationViewController as! EquationViewController
            svc.index = self.index
            svc.cards = self.cards
            svc.settings = self.settings
            svc.flag = 1
        }
        else if segue.identifier == "nextCard"{
            let svc = segue.destinationViewController as! EquationViewController
            svc.index = self.index + 1
            svc.cards = self.cards
            svc.settings = self.settings
            svc.flag = 0
        }
        else if segue.identifier == "home"{
            let svc = segue.destinationViewController as! HomePageViewController
            svc.settings = self.settings
        }
    }
}
