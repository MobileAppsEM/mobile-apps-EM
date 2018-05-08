//
//  Score.swift
//  DontKnowWhatToCallMyGame
//
//  Created by Salman, Muhammad H on 5/4/18.
//  Copyright © 2018 Salman, Muhammad H. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit

class Score
{
    var scoreLabel : SKLabelNode!
    var scene : SKScene?
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    init(SKscene : SKScene)
    {
        scene = SKscene
    }
    
    func MakeScore()
    {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: scene!.size.width / 2 * 0.95, y: scene!.size.height / 2 * 0.88)
        scene?.addChild(scoreLabel)
    }
    
    func updateScore(givenScore : Int)
    {
        score = givenScore
    }
    
    func DisplayFinalScore()
    {
        scoreLabel.fontSize = 100
        scoreLabel.position = CGPoint(x: scene!.size.width / 4.2, y: scene!.size.height / 2 * 0.70)
    }
    
}
