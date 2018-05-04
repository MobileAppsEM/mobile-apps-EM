//
//  MoveableWall.swift
//  DontKnowWhatToCallMyGame
//
//  Created by Salman, Muhammad H on 4/11/18.
//  Copyright © 2018 Salman, Muhammad H. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit

class MoveableWall
{
    // Remember the origin is the center of the scene or the objects.!!!!!!!!!!!!!
    
    var upperRect : SKSpriteNode = SKSpriteNode()
    var lowerRect : SKSpriteNode = SKSpriteNode()
    
    let SKscene : SKScene
    
    let ballGap : CGFloat // set to the size you want it to be
    
    init(Scene : SKScene)
    {
        SKscene = Scene
        ballGap = Scene.size.height * 0.25
    }
    
    func getUpperRectYVal() -> CGFloat
    {
        return upperRect.position.y
    }
    
    func getBallGap() -> CGFloat
    {
        return ballGap
    }
    
    func makeMoveableWall()
    {
        upperRect.size.height = SKscene.size.height - ballGap // 20 is gap for the ball on thi side
        upperRect.size.width = 25
        upperRect.position.y = SKscene.position.y + ballGap / 2 + upperRect.size.height / 2
        
        lowerRect.size.height = SKscene.size.height - ballGap // 20 is gap for the ball on thi side
        lowerRect.size.width = 20
        lowerRect.position.y = SKscene.position.y - lowerRect.size.height / 2 - ballGap / 2
        
        upperRect.physicsBody = SKPhysicsBody(rectangleOf: upperRect.frame.size)
        lowerRect.physicsBody = SKPhysicsBody(rectangleOf: lowerRect.frame.size)
        
        upperRect.color = UIColor.orange
        lowerRect.color = UIColor.orange
        
        upperRect.physicsBody?.affectedByGravity = false
        upperRect.physicsBody?.angularDamping = 0
        upperRect.physicsBody?.isDynamic = false
        upperRect.physicsBody?.allowsRotation = false
        
        lowerRect.physicsBody?.affectedByGravity = false
        lowerRect.physicsBody?.angularDamping = 0
        lowerRect.physicsBody?.isDynamic = false
        lowerRect.physicsBody?.allowsRotation = false
        
        lowerRect.name = "MoveableWallLow"
        upperRect.name = "MoveableWallUpper"
        
        SKscene.addChild(upperRect)
        SKscene.addChild(lowerRect)
    }
    
    func MoveWall(moveBy : CGFloat)
    {
        upperRect.position.y += moveBy
        lowerRect.position.y += moveBy
    }
    
    
}











