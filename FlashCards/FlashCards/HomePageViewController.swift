//
//  HomePageViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 3/31/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import iAd
import UIKit
import StoreKit
import GoogleMobileAds

class HomePageViewController: UIViewController{

    @IBOutlet weak var rateThisApp: UIButton!
    @IBOutlet weak var adView: GADBannerView!
    var settings: Settings!

    @IBOutlet weak var subtraction: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var addition: UIButton!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // Create reference to our app delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.settings == nil{
            self.settings = Settings()
        }
        
        self.adView.adUnitID = "ca-app-pub-5714389273534312/1065143786"
        self.adView.rootViewController = self
        let request = GADRequest()
        request.testDevices = ["3424be15d2aef58bdb2590f69346bf6d"]
        request.tagForChildDirectedTreatment(true)
        self.adView.loadRequest(request)
        
        //appDelegate.adBannerView.center = CGPoint(x: view.frame.midX,
        //    y: view.frame.height - appDelegate.adBannerView.frame.height / 2)
        //Add to view
        //view.addSubview(appDelegate.adBannerView)
        //loadAds()
    }

    
    @IBAction func rateApp(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://itunes.apple.com/app/id1109945555")!);
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
        
        if segue.identifier == "Addition"{
            let svc = segue.destinationViewController as! OptionViewController
            svc.operation = "Addition"
            svc.settings = self.settings
        }
        else if segue.identifier == "Subtraction"{
            let svc = segue.destinationViewController as! OptionViewController
            svc.operation = "Subtraction"
            svc.settings = self.settings
        }
        else if segue.identifier == "Multiplication"{
            let svc = segue.destinationViewController as! OptionViewController
            svc.operation = "Multiplication"
            svc.settings = self.settings
        }
        else if segue.identifier == "Division"{
            let svc = segue.destinationViewController as! OptionViewController
            svc.operation = "Division"
            svc.settings = self.settings
        }
    }
}
