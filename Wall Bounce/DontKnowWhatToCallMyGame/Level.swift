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
    var circleObstacle1 : SKSpriteNode = SKSpriteNode()
    var circleObstacle2 : SKSpriteNode = SKSpriteNode()
    
    let SKscene : SKScene
    
    init(Scene : SKScene) {
        SKscene = Scene
    }
    
    private func makeObstacles()
    {
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
        
        
        wallTop.physicsBody = SKPhysicsBody(rectangleOf: wallTop.frame.size)
        wallTop.physicsBody?.restitution = 0
        wallTop.physicsBody?.friction = 0
        wallTop.physicsBody?.linearDamping = 0
        
        wallBottom.physicsBody = SKPhysicsBody(rectangleOf: wallBottom.frame.size)
        wallBottom.physicsBody?.restitution = 0
        wallBottom.physicsBody?.friction = 0
        wallBottom.physicsBody?.linearDamping = 0
        
        wallRight.physicsBody = SKPhysicsBody(rectangleOf: wallRight.frame.size)
        wallRight.physicsBody?.restitution = 0
        wallRight.physicsBody?.friction = 0
        wallRight.physicsBody?.linearDamping = 0
        
        wallLeft.physicsBody = SKPhysicsBody(rectangleOf: wallLeft.frame.size)
        wallLeft.physicsBody?.restitution = 0
        wallLeft.physicsBody?.friction = 0
        wallLeft.physicsBody?.linearDamping = 0
        
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
        
        wallTop.name = "wallTop"
        wallRight.name = "wallRight"
        wallBottom.name  = "wallBottom"
        wallLeft.name = "wallLeft"
        
        SKscene.addChild(wallLeft)
        SKscene.addChild(wallRight)
        SKscene.addChild(wallTop)
        SKscene.addChild(wallBottom)
        
    
    }
    
    //gets the walls without changing them
    public func getTopWall() -> SKSpriteNode
    {
        return wallTop
    }
    public func getBotWall() -> SKSpriteNode
    {
        return wallBottom
    }
    public func getLeftWall() -> SKSpriteNode
    {
        return wallLeft
    }
    public func getRightWall() -> SKSpriteNode
    {
        return wallRight
    }
    
    
}
