//
//  OptionViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 4/2/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit
import AVFoundation //For Sounds

class QuizViewController: UIViewController {

    var index: Int!
    var cards: Cards!
    var count = 0
    var numMinutes = 2
    var numCorrect: Float = 0.0
    var numTotal: Float = 0.0
    var quiz: Quiz!
    var quizzes: [Quiz]!
    private var time = NSTimer!()
    var soundPlayer = AVAudioPlayer()
    var settings: Settings!
    
    let correctSoundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("correct", ofType: "wav")!)
    let incorrectSoundURL = NSBundle.mainBundle().URLForResource("incorrect", withExtension: "wav")
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var answer: UILabel!

/****************************************************************************************/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numMinutes = self.settings.timeLimit
        
        if self.numMinutes != -1 {
            self.timer.text = "\(self.numMinutes):00"
            time = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        }
        else{
            self.numMinutes = 0
            self.timer.text = "0:00"
            time = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateCount"), userInfo: nil, repeats: true)
        }
        
        self.answer.text = ""
        
        let sides = self.cards.cards[self.index].frontSide.characters.split{$0 == " "}.map(String.init)
        
        self.number1.text = sides[0]
        self.number2.text = sides[2]
        self.operation.text = sides[1]
        self.image.hidden = true
        self.quiz = Quiz(correct: 0, total: 0, op: sides[1])
        self.quizzes = loadQuizzes()
    
        if self.quizzes == nil{
            self.quizzes = []
        }
        self.quizzes.append(self.quiz)
    }
    
/****************************************************************************************/
    
    @IBAction func zeroClicked(sender: UIButton) {
        //if self.answer.text!.characters.count != 0 {
        self.answer.text = self.answer.text! + "0"
        //}
    }
    
/****************************************************************************************/
    
    @IBAction func oneClicked(sender: UIButton) {
        self.answer.text = self.answer.text! + "1"
    }
    
/****************************************************************************************/
    
    @IBAction func twoClicked(sender: UIButton) {
        self.answer.text = self.answer.text! + "2"
    }
    
/****************************************************************************************/
    
    @IBAction func threeClicked(sender: UIButton){
        self.answer.text = self.answer.text! + "3"
    }
    
/****************************************************************************************/
    
    @IBAction func fourClicked(sender: UIButton) {
        self.answer.text = self.answer.text! + "4"
    }
    
/****************************************************************************************/
    
    @IBAction func fiveClicked(sender: UIButton) {
        self.answer.text = self.answer.text! + "5"
    }
    
/****************************************************************************************/
    
    @IBAction func sixClicked(sender: UIButton) {
        self.answer.text = self.answer.text! + "6"
    }
    
/****************************************************************************************/
    
    @IBAction func sevenClicked(sender: UIButton){
        self.answer.text = self.answer.text! + "7"
    }
    
/****************************************************************************************/
    
    @IBAction func eightClicked(sender: UIButton){
        self.answer.text = self.answer.text! + "8"
    }
 
/****************************************************************************************/
    
    @IBAction func nineClicked(sender: UIButton) {
        self.answer.text = self.answer.text! + "9"
    }

/****************************************************************************************/
    
    @IBAction func backspaceClicked(sender: UIButton){
        let length = self.answer.text?.characters.count
        
        if length != 0 {
            let index = self.answer.text!.endIndex.advancedBy(-1)
            self.answer.text = self.answer.text!.substringToIndex(index)
        }
    }
   
/****************************************************************************************/
    
    @IBAction func enterClicked(sender: UIButton) {
        let answerText = Int(self.answer.text!)
        let backSideText = self.cards.cards[self.index].backSide
        var url : NSURL
        self.numTotal = self.numTotal + 1
      
        /*
        let set = NSMutableCharacterSet()
        set.addCharactersInString("0")
        answerText = answerText?.stringByTrimmingCharactersInSet(set)
        */
        
        if answerText == Int(backSideText){
            let photo = UIImage(named: "CheckMark")!
            self.image.image = photo
            self.numCorrect = self.numCorrect + 1
            self.quiz.numCorrect += 1
        //    self.correctSound?.play()
            url = correctSoundURL
        }
        else{
            let photo = UIImage(named: "RedX")!
            self.image.image = photo
            self.cards.cards[self.index].correct = true
        //    self.incorrectSound?.play()
            url = incorrectSoundURL!
        }
        
        self.quiz.numTotal += 1
        
        saveQuiz()
        
        self.index = self.index + 1
        
        if self.index >= self.cards.max{
            time.invalidate()
            time = nil
            performSegueWithIdentifier("finished", sender: nil)
            return
        }
        
        let sides = self.cards.cards[self.index].frontSide.characters.split{$0 == " "}.map(String.init)
        
        do{
            try! playSound(url)
        }
        
        UIView.transitionWithView(self.number1, duration: 0.75, options: [.TransitionFlipFromLeft], animations: {
            self.number1.text = sides[0]
            }, completion: nil)
        
        
        UIView.transitionWithView(self.number2, duration: 0.75, options: [.TransitionFlipFromLeft], animations: {
            self.number2.text = sides[2]
            }, completion: nil)
        
        self.operation.text = sides[1]
        self.answer.text = ""
        
        self.image.hidden = false
        self.image.alpha = 1.0
        
        UIView.animateWithDuration(1, delay: 0.25, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.image.alpha = 0
            }, completion: { finished in
            self.image.hidden = true
        })
    }
    
/****************************************************************************************/

    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }
    
/****************************************************************************************/
    
    func playSound(url: NSURL) throws{
        do{
            try self.soundPlayer = AVAudioPlayer(contentsOfURL: url, fileTypeHint: "aiff")
            self.soundPlayer.prepareToPlay()
            self.soundPlayer.play()
        }
    }

/****************************************************************************************/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/****************************************************************************************/
    
    func update(){
        if self.count > 0{
            self.count--
            let seconds = String(format: "%02d", self.count)
            self.timer.text = "\(self.numMinutes):\(seconds)"
            
            if self.numMinutes == 0 && self.count == 0{
                time.invalidate()
                time = nil
                performSegueWithIdentifier("finished", sender: nil)
            }
        }
        else{
            self.count = 59
            self.numMinutes = self.numMinutes - 1
            self.timer.text = "\(self.numMinutes):\(self.count)"
        }
    }
    
/****************************************************************************************/
    
    func updateCount(){
        self.count++
        let seconds = String(format: "%02d", self.count)
        
        if seconds != "60"{
            self.timer.text = "\(self.numMinutes):\(seconds)"
        }
        else{
            self.numMinutes++
            self.count = 0
            self.timer.text = "\(self.numMinutes):00"
        }
    }

/****************************************************************************************/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "finished"{
            let svc = segue.destinationViewController as! FinishedQuizViewController
            svc.correct = self.numCorrect
            svc.total = self.numTotal
            svc.settings = self.settings
        }
        else if segue.identifier == "home"{
            time.invalidate()
            time = nil
            let svc = segue.destinationViewController as! HomePageViewController
            svc.settings = self.settings
        }
    }
    
/****************************************************************************************/
    
    func saveQuiz(){
        let tester = Quiz.ArchiveURL.path!
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(self.quizzes, toFile: tester)
        
        if !isSuccessfulSave{
            print("Failed to save quiz..")
        }
    }
    
/****************************************************************************************/
    
    func loadQuizzes() -> [Quiz]? {
        let test = NSKeyedUnarchiver.unarchiveObjectWithFile(Quiz.ArchiveURL.path!) as? [Quiz]
        return test
    }
/****************************************************************************************/
}

