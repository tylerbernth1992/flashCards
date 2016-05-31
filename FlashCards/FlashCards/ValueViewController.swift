//
//  ValueViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 4/4/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ValueViewController: UIViewController {

    @IBOutlet weak var ad: GADBannerView!
    @IBOutlet weak var quizSettings: UIButton!
    
    var settings: Settings!
    var operation: String!
    var val: String!
    var numClicked: Int!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // Create reference to our app delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.val! == "F" { //FlashCards option
            self.quizSettings.hidden = true
        }
        
        self.ad.adUnitID = "ca-app-pub-5714389273534312/1065143786"
        self.ad.rootViewController = self
        let request = GADRequest()
        request.testDevices = ["3424be15d2aef58bdb2590f69346bf6d"]
        request.tagForChildDirectedTreatment(true)
        self.ad.loadRequest(request)
        
        
      /*  appDelegate.adBannerView.center = CGPoint(x: view.frame.midX,
            y: view.frame.height - appDelegate.adBannerView.frame.height / 2)
        // Add to view
        view.addSubview(appDelegate.adBannerView)*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/* Button Actions */
    
    @IBAction func oneClicked(sender: UIButton) {
        self.numClicked = 1
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    

    @IBAction func twoClicked(sender: UIButton) {
        self.numClicked = 3
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    @IBAction func threeClicked(sender: UIButton) {
        self.numClicked = 3
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    @IBAction func fourClicked(sender: UIButton) {
        self.numClicked = 4
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    @IBAction func fiveClicked(sender: UIButton) {
        self.numClicked = 5
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    @IBAction func sixClicked(sender: UIButton) {
        self.numClicked = 6
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    @IBAction func sevenClicked(sender: UIButton) {
        self.numClicked = 7
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    @IBAction func eightClicked(sender: UIButton) {
        self.numClicked = 8
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    @IBAction func nineClicked(sender: UIButton) {
        self.numClicked = 9
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }

    @IBAction func tenClicked(sender: UIButton) {
        self.numClicked = 10
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    @IBAction func elevenClicked(sender: UIButton) {
        self.numClicked = 11
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    @IBAction func twelveClicked(sender: UIButton) {
        self.numClicked = 12
        
        if self.val! == "F"{
            performSegueWithIdentifier("startFlashCards", sender: self)
        }
        else{
            performSegueWithIdentifier("startQuiz", sender: self)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "startQuiz"{
            let svc = segue.destinationViewController as! QuizViewController
            let numQuestions = self.settings.numQuestions
            let cards = Cards(type: operation, max: numQuestions, val1: self.numClicked, flag: "Q")
            svc.cards = cards
            svc.index = 0
            svc.settings = self.settings
        }
        else if segue.identifier == "startFlashCards"{
            let svc = segue.destinationViewController as! EquationViewController
            let cards = Cards(type: operation, max: 12, val1: self.numClicked, flag: "F")
            svc.cards = cards
            svc.index = 0
            svc.settings = self.settings
            svc.flag = 0
        }
        else if segue.identifier == "settings"{
            let svc = segue.destinationViewController as! QuizSettingsViewController
            svc.operation = self.operation
            svc.val = self.val
            svc.numClicked = self.numClicked
            svc.settings = self.settings
        }
        else if segue.identifier == "home"{
            let svc = segue.destinationViewController as! HomePageViewController
            svc.settings = self.settings
        }
    }
}
