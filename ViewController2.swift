//
//  ViewController2.swift
//  games
//
//  Created by period6 on 4/27/21.
//  Copyright © 2021 period6. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController2: UIViewController, UICollisionBehaviorDelegate {
    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var paddleView: UIView!
    
    @IBOutlet weak var brickOne: UIView!
    @IBOutlet weak var brickTwo: UIView!
    @IBOutlet weak var brickThree: UIView!
    
    
    @IBOutlet weak var restartButton: UIButton!
    
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var ballDynamicBehavior: UIDynamicItemBehavior!
    var paddleDynamicBehavior: UIDynamicItemBehavior!
    var bricksDynamicBehavior: UIDynamicItemBehavior!
    
    var brickCount = 3
    
    var bricks = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ballView.layer.masksToBounds = true
        ballView.layer.cornerRadius = 20
        
        bricks = [brickOne, brickTwo, brickThree]
        paddleView.isHidden = true
        ballView.isHidden = true
    }
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        paddleView.center = CGPoint(x: sender.location(in: view).x, y: paddleView.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleView)

        
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehaviors()
        paddleView.isHidden = false
        ballView.isHidden = false
        sender.isHidden = true
        let sound = AVSpeechSynthesizer()
        let utter = AVSpeechUtterance(string: "Start The Game")
        sound.speak(utter)
        
        
    }
    
    
    func dynamicBehaviors(){
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        pushBehavior = UIPushBehavior(items: [ballView], mode: .instantaneous)
        pushBehavior.active = true
        pushBehavior.pushDirection = CGVector(dx: 0.7, dy: 0.6)
        pushBehavior.magnitude = 0.8
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [paddleView, ballView] + bricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        collisionBehavior.collisionDelegate = self
        
        ballDynamicBehavior = UIDynamicItemBehavior(items: [ballView])
        ballDynamicBehavior.allowsRotation = true
        ballDynamicBehavior.elasticity = 1.0
        ballDynamicBehavior.friction = 0
        ballDynamicBehavior.resistance = 0
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddleView])
        paddleDynamicBehavior.density = 1000.0
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
        bricksDynamicBehavior = UIDynamicItemBehavior(items: bricks)
        bricksDynamicBehavior.density = 1000.0
        bricksDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(bricksDynamicBehavior)

    }
    
    func alert(){
        var alert = UIAlertController(title: "YOU WON", message: "way to go", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game", style: .default) { (action) in
            self.brickCount = 3
            self.restartButton.isHidden = false
        
       
            
            
        }
        alert.addAction(newGameButton)
        present(alert, animated: true, completion: nil)
        
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        
         for wes in bricks {
                if item1.isEqual(ballView) && item2.isEqual(wes) {
                    wes.isHidden = true
                    collisionBehavior.removeItem(wes)
                    brickCount = brickCount - 1
                    print (brickCount)
                }
        }
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if p.y > paddleView.center.y {
            
        }
        if brickCount == 0 {
            alert()
            self.ballView.isHidden = true
            self.paddleView.isHidden = true
            collisionBehavior.removeItem(ballView)
        }
    }



}
   

        
    

