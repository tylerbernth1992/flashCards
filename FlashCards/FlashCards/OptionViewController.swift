//
//  OptionViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 4/4/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit
import iAd
import GoogleMobileAds

class OptionViewController: UIViewController{
    
    @IBOutlet weak var ad: GADBannerView!
    var operation: String!
    var settings: Settings!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // Create reference to our app delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ad.adUnitID = "ca-app-pub-5714389273534312/1065143786"
        self.ad.rootViewController = self
        let request = GADRequest()
        request.testDevices = ["3424be15d2aef58bdb2590f69346bf6d"]
        request.tagForChildDirectedTreatment(true)
        self.ad.loadRequest(request)
        
        //appDelegate.adBannerView.center = CGPoint(x: view.frame.midX,
        //    y: view.frame.height - appDelegate.adBannerView.frame.height / 2)
        // Add to view
        //view.addSubview(appDelegate.adBannerView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "chooseNumbersFlash"{
            let svc = segue.destinationViewController as! ValueViewController
            svc.operation = self.operation!
            svc.val = "F"
            svc.numClicked = 0
            svc.settings = self.settings
        }
        else if segue.identifier == "chooseNumbersQuiz"{
            let svc = segue.destinationViewController as! ValueViewController
            svc.operation = self.operation!
            svc.val = "Q"
            svc.numClicked = 0
            svc.settings = self.settings
        }
        else if segue.identifier == "home"{
            let svc = segue.destinationViewController as! HomePageViewController
            svc.settings = self.settings
        }
    }
}
