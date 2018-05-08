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
    var BallCollisionV : Bool = false
    var BallCollisionH : Bool = false
    public var death : Bool = false
    var level1 : Level?
    var score : Score?
    var maxBallSpeed : CGVector = CGVector(dx: 10.0, dy: 10.0) // sets max spped ball can reach increment each minute
    var minBallSpeed : CGVector = CGVector(dx: 5.0, dy: 5.0) // half of max speed
    var currentBallSpeed : CGVector = CGVector(dx: 5.0, dy: 5.0)
    var start : Bool = true
    var secondsPassed = 0
    var timer = Timer()
    var counter = 0
    
    override func didMove(to view: SKView)
    {
        physicsWorld.contactDelegate = self
        level1 = Level(Scene : self)
        level1!.makeWalls()
        
        moveable = MoveableWall(Scene: self)
        moveable!.makeMoveableWall()
        
        ball = Ball(scene: self)
        ball!.makeBallMove()
        
        score = Score(SKscene: self)
        score!.MakeScore()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterUpdate), userInfo: nil, repeats: true)
        
        minBallSpeed = CGVector(dx: maxBallSpeed.dx / 2, dy: maxBallSpeed.dy / 2)
        
    }
    func counterUpdate()
    {
        counter += 1
    }
    func stopTimer()
    {
        timer.invalidate()
        counter = 0
    }
    
    func UpdateGameBallSpeed(addedSpeed : CGFloat)
    {
        var addedCurrentX : CGFloat = addedSpeed
        var addedCurrentY : CGFloat = addedSpeed
        
        if(currentBallSpeed.dx < 0)
        {
            addedCurrentX = addedSpeed * -1 // makes it the same sign as the value
        }
        if(currentBallSpeed.dy < 0)
        {
            addedCurrentY = addedSpeed * -1 // makes it the same sign as the value
        }
        
        maxBallSpeed = CGVector(dx: maxBallSpeed.dx + addedSpeed, dy: maxBallSpeed.dy + addedSpeed)
        currentBallSpeed = CGVector(dx: currentBallSpeed.dx + addedCurrentX, dy: currentBallSpeed.dy + addedCurrentY)
    }
    
    func BallBerserk()
    {
        
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
        /*
         
         if (moveable!.getUpperRectYVal() <= self.position.y + self.size.height / 2 + moveable!.upperRect.size.height / 2 &&
         moveable!.getUpperRectYVal() >= self.position.y + moveable!.getBallGap() / 2)
         {
         moveable!.upperRect.position.y = t.location(in: self.view).y + moveable!.upperRect.size.height / 2 + moveable!.ballGap / 2
         moveable!.lowerRect.position.y = t.location(in: self.view).y - moveable!.upperRect.size.height / 2 - moveable!.ballGap / 2
 
        */
        let moveVal : CGFloat = 15
        // let movePos : CGPoint = t.location(in: self.view) // how fast you can move the wall
        
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
                moveable!.upperRect.position.y = self.position.y + self.size.height / 2 + moveable!.upperRect.size.height / 2 - 0.10 // Value of 0.1 is to deter it from going into stale mode
                moveable!.lowerRect.position.y = self.position.y - moveable!.getBallGap() / 2 - 0.1
            }
            else if(moveable!.upperRect.position.y < self.position.y + moveable!.getBallGap() / 2 + moveVal &&
                moveable!.upperRect.position.y > self.position.y + moveable!.getBallGap() / 2)
            {
                moveable!.upperRect.position.y = self.position.y + moveable!.getBallGap() / 2 + 0.1
                moveable!.lowerRect.position.y = self.position.y - self.size.height / 2 - moveable!.lowerRect.size.height / 2 + 0.10
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
        }
        
        
        
        if(death == false)
        {
            checkNoCollision() // If ball doesn't have any collisions with the wall or not.
            score?.updateScore(givenScore : counter)
            ball!.updateBall(ballSpeed: currentBallSpeed)
            
            if(counter % 30 == 0 && counter != 0)
            {
                UpdateGameBallSpeed(addedSpeed: 20)
            }
        }
        else
        {
            death = true
            
            ball!.ballMove.position = CGPoint(x: 0.0,y: 0.0)
            score!.DisplayFinalScore()
            timer.invalidate()
            
        }
        
    }
    
    
    // function part of physics delegate
    func didBegin(_ contact: SKPhysicsContact)
    {
        if death == false
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
            
            BallCollisionV = true
            BallCollisionH = true
        }
    }
    //Will handle any collisions that the all will have perhaps randomize the angle by changing dy by a random amount?
    func CollisionWith(ball : SKNode, object : SKNode)
    {
        if death == false
        {
            // print out to see what it is doing
            var yChange : CGFloat = CGFloat(drand48())
            var xChange : CGFloat = CGFloat(drand48())
            
            while yChange < 0.20 || xChange < 0.20 // can change .20 to a var that will adjust with dificulty
            {
                yChange  = CGFloat(drand48())
                xChange = CGFloat(drand48())
                
            }
            // Need buffer time between collisions so the ball doesn't go into loop
            if BallCollisionV == false
            {
                if object.name == "wallTop"
                {
                    currentBallSpeed.dy = maxBallSpeed.dy * -yChange
                }
                if object.name == "wallBottom"
                {
                    currentBallSpeed.dy = maxBallSpeed.dy * yChange
                }
            }
            if BallCollisionH == false
            {
                if object.name == "wallLeft"
                {
                    currentBallSpeed.dx = maxBallSpeed.dx * xChange
                }
                if object.name == "wallRight"
                {
                    currentBallSpeed.dx = maxBallSpeed.dx * -xChange
                }
            }
            // interaction between moveable wall and ball
            if object.name == "MoveableWallLow" || object.name == "MoveableWallUpper" &&
                (ball.position.y > moveable!.upperRect.position.y - moveable!.upperRect.size.height / 2 + 5 ||
                ball.position.y < moveable!.lowerRect.position.y + moveable!.lowerRect.size.height / 2 - 5) // lets ball hit tip of the moveable wall
            {
                death = true
                
                self.childNode(withName: "MoveableWallLow")?.removeFromParent()
                self.childNode(withName: "MoveableWallUpper")?.removeFromParent()
                
                currentBallSpeed = CGVector.zero
            }
        }
        
        
        // ball collision with moveable wall
    }
    func checkNoCollision() // Need to fix ball sticking to the wall for some reason
    {
        if death == false
        {
            if ball!.ballMove.position.x > 20 && ball!.ballMove.position.x < self.size.width - 20 // made to be 0 after testing
            {
                BallCollisionH = false
            }
            if ball!.ballMove.position.y > 20 && ball!.ballMove.position.y < self.size.height - 20
            {
                BallCollisionV = false
            }
        }
        if(currentBallSpeed.dy == 0)
        {
            currentBallSpeed.dy = maxBallSpeed.dy
        }
    }
}








