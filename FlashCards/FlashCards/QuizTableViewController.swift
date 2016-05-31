//
//  QuizTableViewController.swift
//  FlashCards
//
//  Created by Tyler Bernth on 3/27/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    //MARK: Properties
    
   // @IBOutlet var tableView: UITableView!
    @IBOutlet weak var clearHistory: UIBarButtonItem!
    
    @IBAction func deleteHistory(sender: UIBarButtonItem) {
        quizzes.removeAll()
        saveQuizzes()
        self.tableView.reloadData()
    }
    
    
    var quiz = Quiz!()
    var quizzes: [Quiz] = []
    var savedQuizzes = [Quiz]!()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.quiz = Quiz(correct: 0, total: 0, op: "+")
        
        if let savedQuizzes = loadQuizzes() { //Load the saved quizzes
            quizzes += savedQuizzes
        }
    }
    
    func loadSampleQuizzes() {
        let quiz1 = Quiz(correct: 10, total: 10, op: "+")
        let quiz2 = Quiz(correct: 10, total: 40, op: "-")
        let quiz3 = Quiz(correct: 10, total: 30, op: "x")
        let quiz4 = Quiz(correct: 10, total: 20, op: "+")
        let quiz11 = Quiz(correct: 10, total: 10, op: "+")
        let quiz21 = Quiz(correct: 10, total: 40, op: "-")
        let quiz31 = Quiz(correct: 10, total: 30, op: "x")
        let quiz41 = Quiz(correct: 10, total: 20, op: "+")
        
        quizzes += [quiz1, quiz2, quiz3, quiz4, quiz11, quiz21, quiz31, quiz41]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "QuizTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! QuizTableViewCell

        let quiz = quizzes[indexPath.row]
        
        cell.operation.text = quiz.operation
        
        var percent: Float
        percent = Float( 100 * quiz.numCorrect / quiz.numTotal)
        let percentInt = Int(round(percent))
        
        let text = "\(quiz.date) \(percentInt)% (\(quiz.numCorrect) / \(quiz.numTotal))"
        
        cell.score.text = text
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        let index = indexPath.row
        let quiz = quizzes[index]
        print(quiz.numTotal)
    }

    @IBAction func cancelToTableViewController(segue: UIStoryboardSegue){
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            quizzes.removeAll()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }*/
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    
    
    func saveQuizzes(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(quizzes, toFile: Quiz.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save quizzes...")
        }
    }
    
    func loadQuizzes() -> [Quiz]? {
        let test = NSKeyedUnarchiver.unarchiveObjectWithFile(Quiz.ArchiveURL.path!) as? [Quiz]
        return test
    }
    
}
