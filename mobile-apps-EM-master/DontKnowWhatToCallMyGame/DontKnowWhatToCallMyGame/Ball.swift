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
    var ballMove : SKSpriteNode = SKSpriteNode(imageNamed: "Ball")
    
    init (scene : SKScene) {
        SKscene = scene
    }
    public func makeBallMove()
    {
        
        
        
        ballMove.color = UIColor.white
        
        ballMove.xScale = SKscene.size.width * 0.00025
        ballMove.yScale = SKscene.size.width * 0.00025
        
        ballMove.physicsBody = SKPhysicsBody(circleOfRadius: ballMove.size.width * ballMove.xScale / 2)
        ballMove.physicsBody?.friction = 0.0
        
        
        ballMove.physicsBody?.affectedByGravity = false
        
        ballMove.physicsBody?.isDynamic = false
        
        ballMove.physicsBody?.allowsRotation = false
        
        
        SKscene.addChild(ballMove)
        
        
    }
    
}
