//
//  Ball.swift
//  DontKnowWhatToCallMyGame
//
//  Created by Ethan Sulkin on 4/11/18.
//  Copyright © 2018 Salman, Muhammad H. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit

class Ball
{
    let SKscene : SKScene
    var ballMove : SKSpriteNode = SKSpriteNode()
    
    init (scene : SKScene) {
        SKscene = scene
    }
    public func makeBallMove()
    {
        
    
    ballMove.size.height = SKscene.size.height / 2
    ballMove.size.width = SKscene.size.width / 2
        
    ballMove.position = SKscene.position
        
    ballMove.color = UIColor.white
        
    ballMove.physicsBody = SKPhysicsBody(circleOfRadius: 100)
    ballMove.physicsBody?.friction = 0.0
    
    ballMove.physicsBody?.affectedByGravity = false
    
    SKscene.addChild(ballMove)
        
    }
    
}
