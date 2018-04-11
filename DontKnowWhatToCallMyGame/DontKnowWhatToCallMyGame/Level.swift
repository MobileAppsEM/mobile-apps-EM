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
        
        wallRight.position.x = SKscene.position.x - SKscene.size.width / 2 + wallRight.size.width / 2
        
        wallBottom.position.y = SKscene.position.y + SKscene.size.height - wallLeft.size.height
        
        wallLeft.color = UIColor.cyan
        wallTop.color = UIColor.cyan
        wallBottom.color = UIColor.cyan
        wallRight.color = UIColor.cyan
        
        //SKscene.addChild(wallLeft)
        SKscene.addChild(wallRight)
        //SKscene.addChild(wallTop)
        // SKscene.addChild(wallBottom)
        
    
    }
    
}
