//
//  Level.swift
//  DontKnowWhatToCallMyGame
//
//  Created by Salman, Muhammad H on 4/9/18.
//  Copyright © 2018 Salman, Muhammad H. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Level
{
    var wallLeft : SKSpriteNode = SKSpriteNode()
    var wallRight : SKSpriteNode = SKSpriteNode()
    var wallTop : SKSpriteNode = SKSpriteNode()
    var wallBottom : SKSpriteNode = SKSpriteNode()
    
    let SKscene : SKScene
    
    init(Scene : SKScene) {
        SKscene = Scene
    }
    public func makeWalls()
    {
        
        wallLeft.size.height = SKscene.size.height
        wallRight.size.height = SKscene.size.height
        wallLeft.size.width = 20
        wallRight.size.width = 20
        
        wallTop.size.width = SKscene.size.width
        wallBottom.size.width = SKscene.size.width
        wallTop.size.height = 20
        wallBottom.size.height = 20
        
        wallRight.position.x = SKscene.position.x + SKscene.size.width / 2 - wallRight.size.width / 2
        
        wallLeft.position.x = SKscene.position.x - SKscene.size.width / 2 + wallRight.size.width / 2
        
        wallBottom.position.y = SKscene.position.y - SKscene.size.height / 2 + wallBottom.size.height / 2
        wallTop.position.y = SKscene.position.y + SKscene.size.height / 2 - wallTop.size.height / 2
        
        
        wallLeft.color = UIColor.cyan
        wallTop.color = UIColor.cyan
        wallBottom.color = UIColor.cyan
        wallRight.color = UIColor.cyan
        
        wallLeft.physicsBody = SKPhysicsBody(rectangleOf: wallLeft.frame.size)
        wallLeft.physicsBody?.restitution = 0
        wallLeft.physicsBody?.friction = 0.1
        
        wallTop.physicsBody = SKPhysicsBody(rectangleOf: wallTop.frame.size)
        wallTop.physicsBody?.restitution = 0
        wallTop.physicsBody?.friction = 0.1
        
        wallBottom.physicsBody = SKPhysicsBody(rectangleOf: wallBottom.frame.size)
        wallBottom.physicsBody?.restitution = 0
        wallBottom.physicsBody?.friction = 0.1
        
        wallRight.physicsBody = SKPhysicsBody(rectangleOf: wallRight.frame.size)
        wallRight.physicsBody?.restitution = 0
        wallRight.physicsBody?.friction = 0.1
        
        wallLeft.physicsBody?.affectedByGravity = false
        wallTop.physicsBody?.affectedByGravity = false
        wallBottom.physicsBody?.affectedByGravity = false
        wallRight.physicsBody?.affectedByGravity = false
        
        wallLeft.physicsBody?.isDynamic = false
        wallTop.physicsBody?.isDynamic = false
        wallBottom.physicsBody?.isDynamic = false
        wallRight.physicsBody?.isDynamic = false
        
        wallLeft.physicsBody?.allowsRotation = false
        wallTop.physicsBody?.allowsRotation = false
        wallBottom.physicsBody?.allowsRotation = false
        wallRight.physicsBody?.allowsRotation = false
        
        SKscene.addChild(wallLeft)
        SKscene.addChild(wallRight)
        SKscene.addChild(wallTop)
        SKscene.addChild(wallBottom)
        
    
    }
    
}
