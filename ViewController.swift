//
//  ViewController.swift
//  games
//
//  Created by period6 on 4/5/21.
//  Copyright © 2021 period6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var myView: UIView!
    
    
    
    var allLabels: [UILabel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        turnLabel.text = "X"
        allLabels = [labelOne, labelTwo, labelThree, labelFour, labelFive, labelSix, labelSeven, labelEight, labelNine]

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: myView)
        for label in allLabels  {
            if label.frame.contains(selectedPoint) {
                placeIntoLabel(myLabel: label)
                
                print("tapped")
            }
        }
        checkForWinner()
    }
        
        func placeIntoLabel(myLabel: UILabel)
        {
            if myLabel.text == ""
            {
                if turnLabel.text == "X"
                {
                myLabel.text = turnLabel.text
                turnLabel.text = "O"
                }
        else {
            print("")
            myLabel.text = turnLabel.text
            turnLabel.text = "X"
                
            }
            }
    }
            
    
    
    
    
            func resetButton(_ sender: Any) {
        labelOne.text = ""
        labelTwo.text = ""
        labelThree.text = ""
        labelFour.text = ""
        labelFive.text = ""
        labelSix.text = ""
        labelSeven.text = ""
        labelEight.text = ""
        labelNine.text = ""
    }
    
    func checkForWinner () {
       
        if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text && labelOne.text != "" {}
        
        if  labelOne.text == labelFour.text && labelFour.text == labelSeven.text && labelOne.text != "" {}
        
        if  labelTwo.text == labelFive.text && labelFive.text == labelEight.text && labelTwo.text != "" {}
        
        if  labelThree.text == labelSix.text && labelSix.text == labelNine.text && labelThree.text != "" {}
        
        if  labelFour.text == labelFive.text && labelFive.text == labelSix.text && labelFour.text != "" {}
        
        if  labelSeven.text == labelEight.text && labelEight.text == labelNine.text && labelSeven.text != "" {}
        
        if  labelOne.text == labelFive.text && labelFive.text == labelNine.text && labelOne.text != "" {}
        
        if  labelThree.text == labelFive.text && labelFive.text == labelSeven.text && labelThree.text != "" {}
    }
    
    func alert(){
        var alert = UIAlertController(title: "YOU WON", message: "way to go", preferredStyle: .alert)
        var newGame = UIAlertAction(title: "New Game", style: .cancel, handler: self.resetButton(_:))
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(newGame)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
           
    }
    
    func reset() {
        for label in allLabels{
            label.text = ""
        }
    }
}


