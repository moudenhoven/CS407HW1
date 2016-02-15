//
//  secondViewController.swift
//  CS407HW1
//
//  Created by Michael Oudenhoven on 2/9/16.
//  Copyright © 2016 Michael Oudenhoven. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionAnswer: UITextField!
    //variable to tell if the first question was right or not
    var q1Correct = false
    var q1Answer:String?
    
    var q2Answer:Int?
    
    //alert to make sure the user wants to submit their answer for sure
    var submitAlertView : UIAlertController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //setup the alert view to be shown when the user presses submit
        submitAlertView = UIAlertController(title: "Submit?", message: "You will not be able to go back and change your answer.", preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alert: UIAlertAction!) -> Void in
            //print("cancel submission")
        }
        let submit = UIAlertAction(title: "Submit", style: UIAlertActionStyle.Default) { (alert: UIAlertAction!) -> Void in
            //print("allowed submission")
            //user clicks submit, segue to the second view controller
            self.performSegueWithIdentifier("toResultsViewController", sender: self)
        }
        
        //add the alert actions to the alert controller
        submitAlertView!.addAction(cancel)
        submitAlertView!.addAction(submit)
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        //empty anything out of the text field every time the view appears
        questionAnswer.text = ""
        
        //load the queestion into the label
        //generation of a random integer between 0 and 100. Int+extensions.swift from Ray Wenderlich
        let firstNum = Int.random(min: 0, max: 100)
        let secNum = Int.random(min: 0, max: 100)
        
        let question = "\(firstNum) + \(secNum) = ?"
        
        //set the question
        questionLabel.text = question
        
        //calculate the answer
        q2Answer = firstNum + secNum
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitClicked(sender: AnyObject) {
        //show the alert view to make sure users want to submit their answer
        self.presentViewController(submitAlertView!, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toResultsViewController" {
            //pass data here
            
            //get the destination view controller and cast as the results view controller
            let vc = segue.destinationViewController as! resultsViewController
            
            //pass the data from the first question and the correct answer for the current question
            //to the results view controller
            vc.q1Answer = self.q1Answer
            vc.q1Correct = self.q1Correct
            vc.q2Answer = self.q2Answer
            
            //cast the UITextField Answer to an integer
            let userAnswer = Int(questionAnswer!.text!)
            
            //if the user put the same answer as the correct set bool to true
            if userAnswer == q2Answer {
                vc.q2Correct = true
            }
            //user got answer wrong, set to false
            else {
                vc.q2Correct = false
            }
            
        }
    }
    

}
