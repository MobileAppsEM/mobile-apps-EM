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
    var ballMove : SKSpriteNode = SKSpriteNode(imageNamed: "Spaceship")
    
    init (scene : SKScene) {
        SKscene = scene
    }
    public func makeBallMove()
    {
        
        
        ballMove.position = SKscene.position
        
        ballMove.color = UIColor.white
        ballMove.size.height = SKscene.size.height * 0.05
        ballMove.size.width = SKscene.size.width * 0.05
        
    
        ballMove.physicsBody = SKPhysicsBody(circleOfRadius: 1)
        ballMove.physicsBody?.friction = 0.0
        
        ballMove.physicsBody?.affectedByGravity = false
        
        ballMove.physicsBody?.isDynamic = false
        
        ballMove.physicsBody?.allowsRotation = false
        
        SKscene.addChild(ballMove)
        
        
    }
    
}
