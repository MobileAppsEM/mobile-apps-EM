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

class GameScene: SKScene {
    
    
    var moveable : MoveableWall?
    var touchStartY : CGFloat = 0.0
    var ballMove: Ball?
    
    override func didMove(to view: SKView)
    {
     
        
        moveable = MoveableWall(Scene: self)
        moveable!.makeMoveableWall()
        
        ballMove = Ball(scene: self)
        ballMove!.makeBallMove()
        let level1 : Level = Level(Scene : self)
        level1.makeWalls()
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
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
