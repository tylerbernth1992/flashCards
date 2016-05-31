//
//  EquationViewViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 3/31/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit
import GoogleMobileAds

class EquationViewController: UIViewController {
    var index: Int!
    var cards: Cards!
    var settings: Settings!
    var flag: Int!
    
    @IBOutlet weak var next: UIButton!
    @IBOutlet weak var ad: GADBannerView!
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet var tapGesture: UITapGestureRecognizer!

    @IBOutlet weak var nextButton: UIButton!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // Create reference to our app delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.cards.max == ( self.index ){
            self.index = 0
        }
        let sides = self.cards.cards[self.index].frontSide.characters.split{$0 == " "}.map(String.init)
        
        self.number1.text = sides[0]
        self.number2.text = sides[2]
        self.operation.text = sides[1]
        
        self.number1.font = UIFont(name: "Chalkboard SE", size: 175)
        self.number2.font = UIFont(name: "Chalkboard SE", size: 175)
        self.operation.font = UIFont(name: "Chalkboard SE", size: 175)
        
      /*  appDelegate.adBannerView.center = CGPoint(x: view.frame.midX,
            y: view.frame.height - appDelegate.adBannerView.frame.height / 2)
        // Add to view
        view.addSubview(appDelegate.adBannerView)*/
        
        /*if self.flag! == 0{ //Invisible
            self.nextButton.hidden = true
        }
        else{
            self.nextButton.hidden = false
        }*/
        
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
    
    @IBAction func nextCard(sender: UIButton) {
        if self.cards.max == self.index - 1{//return to home page because we finished all of the cards
            self.index = 0
            performSegueWithIdentifier("nextCard", sender: self)
        }
        else{
            performSegueWithIdentifier("nextCard", sender: self)
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller
        if segue.identifier == "flipToAnswer"{
            let svc = segue.destinationViewController as! AnswerViewController
            svc.index = self.index
            svc.cards = self.cards
            svc.settings = self.settings
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
