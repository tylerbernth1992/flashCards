//
//  QuizSettingsViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 4/18/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit
import GoogleMobileAds

class QuizSettingsViewController: UIViewController {

    @IBOutlet weak var ad: GADBannerView!
    @IBOutlet weak var twoMinutes: UIButton!
    @IBOutlet weak var fiveMinute: UIButton!
    @IBOutlet weak var none: UIButton!
    @IBOutlet weak var oneMinute: UIButton!
    
    @IBOutlet weak var tenQuestions: UIButton!
    @IBOutlet weak var twentyFiveQuestions: UIButton!
    @IBOutlet weak var fiftyQuestions: UIButton!
    
    var operation: String!
    var val: String!
    var numClicked: Int!
    var settings: Settings!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fixTimeButtons()
        fixQuestionsButtons()
        
        self.ad.adUnitID = "ca-app-pub-5714389273534312/1065143786"
        self.ad.rootViewController = self
        let request = GADRequest()
        request.testDevices = ["3424be15d2aef58bdb2590f69346bf6d"]
        request.tagForChildDirectedTreatment(true)
        self.ad.loadRequest(request)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func twoClicked(sender: UIButton) {
        /*self.oneMinute.setBackgroundImage(UIImage(named: "1.png"), forState: UIControlState.Normal)
        self.twoMinutes.setBackgroundImage(UIImage(named: "2Dark.png"), forState: UIControlState.Normal)
        self.fiveMinute.setBackgroundImage(UIImage(named: "5.png"), forState: UIControlState.Normal)
        self.none.setBackgroundImage(UIImage(named: "9.png"), forState: UIControlState.Normal)
        */
        self.settings.timeLimit = 2
        
        fixTimeButtons()
    }

    @IBAction func fiveClicked(sender: UIButton) {
        /*self.oneMinute.setBackgroundImage(UIImage(named: "1.png"), forState: UIControlState.Normal)
        self.twoMinutes.setBackgroundImage(UIImage(named: "2.png"), forState: UIControlState.Normal)
        self.fiveMinute.setBackgroundImage(UIImage(named: "5Dark.png"), forState: UIControlState.Normal)
        self.none.setBackgroundImage(UIImage(named: "9.png"), forState: UIControlState.Normal)
        */
        self.settings.timeLimit = 5
        
        fixTimeButtons()
    }
    
    @IBAction func unlimitedClicked(sender: UIButton) {
        /*self.oneMinute.setBackgroundImage(UIImage(named: "1.png"), forState: UIControlState.Normal)
        self.twoMinutes.setBackgroundImage(UIImage(named: "2.png"), forState: UIControlState.Normal)
        self.fiveMinute.setBackgroundImage(UIImage(named: "5.png"), forState: UIControlState.Normal)
        self.none.setBackgroundImage(UIImage(named: "1Dark.png"), forState: UIControlState.Normal)
        */
        self.settings.timeLimit = -1
        
        fixTimeButtons()
    }
    
    @IBAction func oneClicked(sender: UIButton) {
       /* self.oneMinute.setBackgroundImage(UIImage(named: "1Dark.png"), forState: UIControlState.Normal)
        self.twoMinutes.setBackgroundImage(UIImage(named: "2.png"), forState: UIControlState.Normal)
        self.fiveMinute.setBackgroundImage(UIImage(named: "5.png"), forState: UIControlState.Normal)
        self.none.setBackgroundImage(UIImage(named: "None.png"), forState: UIControlState.Normal)
        */
        self.settings.timeLimit = 1
        
        fixTimeButtons()
    }
    
    
    @IBAction func tenClicked(sender: UIButton) {
        self.settings.numQuestions = 10
        
        fixQuestionsButtons()
    }
    
    @IBAction func twentyFiveClicked(sender: UIButton) {
        self.settings.numQuestions = 25
        
        fixQuestionsButtons()
    }
    
    @IBAction func fiftyClicked(sender: UIButton) {
        self.settings.numQuestions = 50
        
        fixQuestionsButtons()
    }
    
    
    
    func fixTimeButtons(){
        self.oneMinute.setBackgroundImage(UIImage(named: "1.png"), forState: UIControlState.Normal)
        self.twoMinutes.setBackgroundImage(UIImage(named: "2.png"), forState: UIControlState.Normal)
        self.fiveMinute.setBackgroundImage(UIImage(named: "5.png"), forState: UIControlState.Normal)
        self.none.setBackgroundImage(UIImage(named: "None.png"), forState: UIControlState.Normal)
        
        let timeLimit = self.settings.timeLimit
        
        if timeLimit == 1{
            self.oneMinute.setBackgroundImage(UIImage(named: "1Dark.png"), forState: UIControlState.Normal)
        }
        else if timeLimit == 2{
            self.twoMinutes.setBackgroundImage(UIImage(named: "2Dark.png"), forState: UIControlState.Normal)
        }
        else if timeLimit == 5{
            self.fiveMinute.setBackgroundImage(UIImage(named: "5Dark.png"), forState: UIControlState.Normal)
        }
        else{
            self.none.setBackgroundImage(UIImage(named: "NoneDark.png"), forState: UIControlState.Normal)
        }
    }
    
    
    func fixQuestionsButtons(){
        self.tenQuestions.setBackgroundImage(UIImage(named: "10.png"), forState: UIControlState.Normal)
        self.twentyFiveQuestions.setBackgroundImage(UIImage(named: "25.png"), forState: UIControlState.Normal)
        self.fiftyQuestions.setBackgroundImage(UIImage(named: "50.png"), forState: UIControlState.Normal)
        
        let numQuestions = self.settings.numQuestions
        
        if numQuestions == 10{
            self.tenQuestions.setBackgroundImage(UIImage(named: "10Dark.png"), forState: UIControlState.Normal)
        }
        else if numQuestions == 25{
            self.twentyFiveQuestions.setBackgroundImage(UIImage(named: "25Dark.png"), forState: UIControlState.Normal)
        }
        else{
            self.fiftyQuestions.setBackgroundImage(UIImage(named: "50Dark.png"), forState: UIControlState.Normal)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "back"{
            let svc = segue.destinationViewController as! ValueViewController
            svc.operation = self.operation
            svc.val = self.val
            svc.numClicked = self.numClicked
            svc.settings = self.settings
        }
    }


}
