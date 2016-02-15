//
//  ViewController.swift
//  CS407HW1
//
//  Created by Michael Oudenhoven on 2/9/16.
//  Copyright © 2016 Michael Oudenhoven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - VARIABLES
    
    //links to the UI elements in the storyboard
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionAnswer: UITextField!
    
    var submitAlertView : UIAlertController?
    
    //image shown to correspond to the image and correct answer
    var imageNumShown = -1
    var answers = ["Wisconsin", "Ohio", "Illinois", "Michigan", "Iowa", "Minnesota"]
    
    
    //MARK: - METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionLabel.text = "Which state does the image show?"
        
        submitAlertView = UIAlertController(title: "Submit?", message: "You will not be able to go back and change your answer.", preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alert: UIAlertAction!) -> Void in
            //print("cancel submission")
        }
        let submit = UIAlertAction(title: "Submit", style: UIAlertActionStyle.Default) { (alert: UIAlertAction!) -> Void in
            //print("allowed submission")
            //user clicks submit, segue to the second view controller
            self.performSegueWithIdentifier("toSecondViewController", sender: self)
        }
        
        //add the alert actions to the alert controller
        submitAlertView!.addAction(cancel)
        submitAlertView!.addAction(submit)
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        //change the image each time the image will appear
        imageNumShown = Int.random(min: 0, max: answers.count-1)
        //set the correct image onto the screen
        imageView.image = UIImage(named: answers[imageNumShown])
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        
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
        
        if segue.identifier == "toSecondViewController" {
            //pass data here
            let vc = segue.destinationViewController as! secondViewController
            
            //pass the answer to the question
            vc.q1Answer = answers[imageNumShown]
            
            
            //user answered question correctly
            if questionAnswer!.text == answers[imageNumShown] {
                vc.q1Correct = true
            }
            //user answered incorrectly
            else {
                vc.q1Correct = false
            }

            
        }
    }
    

}

