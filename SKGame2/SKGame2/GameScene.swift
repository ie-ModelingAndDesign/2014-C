//
//  GameScene.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/03.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import SpriteKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    let redCategory: UInt32 = 0x1 << 0
    let greenCategory: UInt32 = 0x1 << 1
    
    let teacher = SKSpriteNode(imageNamed: "kono3.jpg")
    
    var myLabel : SKLabelNode = SKLabelNode(text: "60")
    var time :Int = 60
    var pointLabel : SKLabelNode = SKLabelNode(text: "0")
    var point : Int = 0

    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -1.0)
        /* Setup your scene here
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)*/
        teacher.xScale = 0.3
        teacher.yScale = 0.3
        teacher.position = CGPoint(x:500, y:100)
        teacher.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(50, 50))
        teacher.physicsBody?.affectedByGravity = false
        teacher.physicsBody?.dynamic = false
        teacher.physicsBody?.categoryBitMask = redCategory
        teacher.physicsBody?.contactTestBitMask = greenCategory
        self.addChild(teacher)
        
        //myLabel.color = UIColor.redColor()
        myLabel.position = CGPoint(x:700,y:700)
        self.addChild(myLabel)
        
        //pointLabel.color = UIColor.blueColor()
        pointLabel.position = CGPoint(x:650,y:700)
        self.addChild(pointLabel)
        
        
        var timer1 = NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: "flowItem1", userInfo: nil, repeats: true)
        
        var gameTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "gameTimer", userInfo: nil, repeats: true)
    }
    
    func gameTimer(){
        time--
        self.myLabel.text = String(self.time)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            println(location)
            if(location.x < 500){
                teacher.position.x -= 5
                println("go left")
            }else{
                teacher.position.x += 5
                println("go right")
            }
            /*let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)*/
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
    func flowItem1(){
        var x_pos : CGFloat = CGFloat(arc4random_uniform(375) * 2)
        let item1 = SKSpriteNode(imageNamed: "item1.jpeg")
        item1.xScale = 0.2
        item1.yScale = 0.2
        item1.position = CGPoint(x: /*500*/x_pos,y: 800)
        item1.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(70, 50))
        item1.physicsBody?.categoryBitMask = greenCategory
        item1.physicsBody?.contactTestBitMask = redCategory
        self.addChild(item1)
        /*var flag : Bool = true
        var x_pos : CGFloat = CGFloat(arc4random_uniform(375))
        item1Image.center.x = x_pos
        UIView.animateWithDuration(4, animations: {self.item1Image.center.y += 800}, completion: { finished in self.item1Image.center = self.defaultItemPoint
            flag = false})*/
        /*while flag {
        if CGRectIntersectsRect(self.item1Image.frame, self.playerImage.frame){
        println("collide")
        }
        }*/
        
        /*var x_pos : CGFloat = CGFloat(arc4random_uniform(375))
        var y_pos : CGFloat = item1Image.center.y
        println(x_pos)
        item1Image.center.x = x_pos
        while true {
        println("loop")
        y_pos += 0.05
        item1Image.center = CGPointMake(x_pos, y_pos)
        println(item1Image.center.y)
        if item1Image.center.y > 700{
        item1Image.center.y = defaultItemPoint.y
        break
        }
        }*/
        println("flowItem1()")
        
        /*self.view.addSubview(itemManager.getImageView(itemManager.itemCounter))*/
        
    }
    
    func didBeginContact(contact: SKPhysicsContact!){
        
        var firstBody, secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
    if(firstBody.categoryBitMask & redCategory != 0 &&
    secondBody.categoryBitMask & greenCategory != 0){
        println("collide")
    secondBody.node?.removeFromParent()
        point += 100
        pointLabel.text = String(point)
    }
    }

}
