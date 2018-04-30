//
//  GameScene.swift
//  DontKnowWhatToCallMyGame
//
//  Created by Salman, Muhammad H on 4/5/18.
//  Copyright © 2018 Salman, Muhammad H. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit

// shows double Iphone 6 check it out and then you will be done

class GameScene: SKScene, SKPhysicsContactDelegate
{
    
    var moveable : MoveableWall?
    var touchStartY : CGFloat = 0
    var ball : Ball?
    var maxBallSpeed : CGVector = CGVector(dx: 100.0, dy: 100.0)
    var currentBallSpeed : CGVector = CGVector(dx: 70.0, dy: 70.0)
    var start : Bool = true
    
    override func didMove(to view: SKView)
    {
        physicsWorld.contactDelegate = self
        
        let level1 : Level = Level(Scene : self)
        level1.makeWalls()
        
        moveable = MoveableWall(Scene: self)
        moveable!.makeMoveableWall()
        
        ball = Ball(scene: self)
        ball!.makeBallMove()
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        
    
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches
        { // guard instead?
            touchStartY = t.location(in: self.view).y
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches
        {
            moveRectGesture(t)
        }
    }
    func moveRectGesture(_ t : UITouch)
    {
        let moveVal : CGFloat = 15
        
        if (moveable!.getUpperRectYVal() <= self.position.y + self.size.height / 2 + moveable!.upperRect.size.height / 2 &&
            moveable!.getUpperRectYVal() >= self.position.y + moveable!.getBallGap() / 2)
        {
            if (t.location(in: self.view).y > touchStartY &&
                moveable!.upperRect.position.y - moveVal > self.position.y + moveable!.getBallGap() / 2)
            {
                moveable?.MoveWall(moveBy: -moveVal)
            }
            else if (t.location(in: self.view).y < touchStartY &&
                moveable!.upperRect.position.y + moveVal < self.position.y + self.size.height / 2 + moveable!.upperRect.size.height / 2)
            {
                moveable?.MoveWall(moveBy: moveVal)
            }
            else if(moveable!.upperRect.position.y < self.position.y + self.size.height / 2 + moveable!.upperRect.size.height / 2 && moveable!.upperRect.position.y > self.position.y + self.size.height / 2 + moveable!.upperRect.size.height / 2 - moveVal)
            {
                moveable!.upperRect.position.y = self.position.y + self.size.height / 2 + moveable!.upperRect.size.height / 2 - 0.1 // Value of 0.1 is to deter it from going into stale mode
                moveable!.lowerRect.position.y = self.position.y - moveable!.getBallGap() / 2 - 0.1
            }
            else if(moveable!.upperRect.position.y < self.position.y + moveable!.getBallGap() / 2 + moveVal &&
                moveable!.upperRect.position.y > self.position.y + moveable!.getBallGap() / 2)
            {
                moveable!.upperRect.position.y = self.position.y + moveable!.getBallGap() / 2 + 0.1
                moveable!.lowerRect.position.y = self.position.y - self.size.height / 2 - moveable!.lowerRect.size.height / 2 + 0.1
            }
            touchStartY = t.location(in: self.view).y
            
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
        if start == true
        {
            start = false
            ball!.pushBall(ballSpeed : currentBallSpeed)
        }
    }
    
    
    // function part of physics delegate
    func didBegin(_ contact: SKPhysicsContact)
    {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "Ball"
        {
            CollisionWith(ball: nodeA, object: nodeB)
        }
        else if nodeB.name == "Ball"
        {
            CollisionWith(ball: nodeB, object: nodeA)
        }
        
    }
    //Will handle any collisions that the all will have perhaps randomize the angle by changing dy by a random amount?
    // the randomness i making the value only drop and not return back to normal meaning a reset speedvector is needed to be used
    func CollisionWith(ball : SKNode, object : SKNode)
    {
        // print out to see what it is doing
        let yChange : CGFloat = CGFloat(drand48())
        let xChange : CGFloat = CGFloat(drand48())
        
        if object.name == "wallTop"
        {
            currentBallSpeed.dy = maxBallSpeed.dy * -yChange
        }
        if object.name == "wallBottom"
        {
            currentBallSpeed.dy = maxBallSpeed.dy * yChange
        }
        if object.name == "wallLeft"
        {
            currentBallSpeed.dx = maxBallSpeed.dx * xChange
        }
        if object.name == "wallRight"
        {
            currentBallSpeed.dx = maxBallSpeed.dx * -xChange
        }
    }
}








