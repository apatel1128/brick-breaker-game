//
//  ViewController3.swift
//  games
//
//  Created by period6 on 5/17/21.
//  Copyright © 2021 period6. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UICollisionBehaviorDelegate {
    
    
    @IBOutlet weak var topPaddleView: UIView!
    @IBOutlet weak var bottomPaddleView: UIView!
    @IBOutlet weak var ballView: UIView!
    
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var ballDynamicBehavior: UIDynamicItemBehavior!
    var toppaddleDynamicBehavior: UIDynamicItemBehavior!
    var bottompaddleDynamicBehavior: UIDynamicItemBehavior!
    var bricksDynamicBehavior: UIDynamicItemBehavior!
    
    var paddles = [UIView]()
    var items = [UIView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.layer.masksToBounds = true
        ballView.layer.cornerRadius = 40
        
        paddles = [topPaddleView, bottomPaddleView]
        items = [topPaddleView, bottomPaddleView, ballView]
        
        
        
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        topPaddleView.center = CGPoint(x: sender.location(in: view).x, y: topPaddleView.center.y)
        dynamicAnimator.updateItem(usingCurrentState: topPaddleView)
        
        bottomPaddleView.center = CGPoint(x: sender.location(in: view).x, y: bottomPaddleView.center.y)
        dynamicAnimator.updateItem(usingCurrentState: bottomPaddleView)
    }
    
    func dynamicBehaviors(){
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        pushBehavior = UIPushBehavior(items: [ballView], mode: .instantaneous)
        pushBehavior.active = true
        pushBehavior.pushDirection = CGVector(dx: 0.7, dy: 0.6)
        pushBehavior.magnitude = 0.8
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: paddles + items)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        
        
        ballDynamicBehavior = UIDynamicItemBehavior(items: [ballView])
        ballDynamicBehavior.allowsRotation = true
        ballDynamicBehavior.elasticity = 1.0
        ballDynamicBehavior.friction = 0
        ballDynamicBehavior.resistance = 0
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        toppaddleDynamicBehavior = UIDynamicItemBehavior(items: [topPaddleView])
        toppaddleDynamicBehavior.density = 1000.0
        toppaddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(toppaddleDynamicBehavior)
        
        bottompaddleDynamicBehavior = UIDynamicItemBehavior(items: [bottomPaddleView])
        bottompaddleDynamicBehavior.density = 1000.0
        bottompaddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(bottompaddleDynamicBehavior)
        collisionBehavior.collisionDelegate = self

    }
    
    


        
        
    
    
    
    
    

    
}
