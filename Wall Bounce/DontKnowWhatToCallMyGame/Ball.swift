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
    let scene : SKScene
    var ballMove : SKSpriteNode = SKSpriteNode(imageNamed: "Ball")
    
    init (scene : SKScene)
    {
        self.scene = scene
    }
    public func makeBallMove()
    {
        ballMove.name = "Ball"
        ballMove.color = UIColor.white
        
        ballMove.size.width = scene.size.width * 0.2
        ballMove.size.height = scene.size.width * 0.15
        
        ballMove.physicsBody = SKPhysicsBody(texture: ballMove.texture!, size: ballMove.size)
        ballMove.physicsBody?.friction = 0.0
        ballMove.physicsBody?.restitution = 1
        ballMove.physicsBody?.affectedByGravity = false
        ballMove.physicsBody?.isDynamic = true
        ballMove.physicsBody?.allowsRotation = false
        ballMove.physicsBody?.linearDamping = 0
        
        ballMove.physicsBody?.contactTestBitMask = ballMove.physicsBody!.collisionBitMask
     
        scene.addChild(ballMove)
    }
    
    public func updateBall(ballSpeed : CGVector)
    {
        ballMove.position.x += ballSpeed.dx
        ballMove.position.y += ballSpeed.dy        
    }
    
    public func pushBall(ballSpeed : CGVector)
    {
        ballMove.physicsBody?.applyImpulse(ballSpeed) // It increases the ballSpeed
        
    }
    
    
}
