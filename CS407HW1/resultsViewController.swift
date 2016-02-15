//
//  resultsViewController.swift
//  CS407HW1
//
//  Created by Michael Oudenhoven on 2/9/16.
//  Copyright © 2016 Michael Oudenhoven. All rights reserved.
//

import UIKit

class resultsViewController: UIViewController {

    //variables to display answers and statistics on the quiz
    var q1Correct:Bool?
    var q1Answer:String?
    var q2Correct:Bool?
    var q2Answer:Int?
    
    //labels showing user the number correct, incorrect, and the correct answers to the questions
    @IBOutlet weak var numCorrectLabel: UILabel!
    @IBOutlet weak var numIncorrectLabel: UILabel!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        //number of questions answered correctly or incorrectly
        var numCorrect = 0
        var numIncorrect  = 0
        
        //check if both of the answers were right
        if q1Correct == true && q2Correct == true {
            numCorrect = 2
            numIncorrect = 0
        }
        //check if 1 of the 2 answers were correct
        else if q1Correct == true || q2Correct == true {
            numCorrect = 1
            numIncorrect = 1
        }
        //else none were answered correctly
        else {
            numCorrect = 0
            numIncorrect = 2
        }
        
        
        //set the labels to their correct values
        numCorrectLabel.text = "Number Correct: \(numCorrect)"
        numIncorrectLabel.text = "Number Incorrect: \(numIncorrect)"
        correctAnswersLabel.text = "Correct Answers: \(q1Answer!), \(q2Answer!)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func retryClicked(sender: AnyObject) {
        //go back to first question if the user wants to retry the quiz
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
