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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        //load the queestion into the label
        
        let firstNum = Int.random(min: 0, max: 100)
        let secNum = Int.random(min: 0, max: 100)
        
        let question = "What is the following sum? \(firstNum) + \(secNum) = ?"
        
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
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toResultsViewController" {
            //pass data here
            
        }
    }
    

}
