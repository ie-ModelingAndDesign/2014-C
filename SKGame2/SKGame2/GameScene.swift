//
//  GameScene.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/03.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import SpriteKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var delegate_escape: SceneEscapeProtocol?
    
    var difficulty : Int?
    var gameID : Int?
    
    var gameInfo : GameInfo?
    
    let gameData : GameData = GameData()
    var data : Data = Data()
    
    let redCategory: UInt32 = 0x1 << 0
    let greenCategory: UInt32 = 0x1 << 1
    
    var teacher = SKSpriteNode()
    
    var myLabel : SKLabelNode = SKLabelNode(text: "30")
    var time :Int = 30
    var pointLabel : SKLabelNode = SKLabelNode(text: "0")
    var point : Int = 0
    
    var startTimer : NSTimer?
    var countDown : NSTimer?
    var timer1 : NSTimer?
    var timer2 : NSTimer?
    var timer3 : NSTimer?
    var gameTimer : NSTimer?
    
    var numLabel : SKLabelNode = SKLabelNode()
    
    var count : Int = 3
    
    var sound1 : SKAction = SKAction.playSoundFileNamed("sound1.mp3", waitForCompletion: false)
    var sound2 : SKAction = SKAction.playSoundFileNamed("sound2.mp3", waitForCompletion: false)
    var sound3 : SKAction = SKAction.playSoundFileNamed("sound3.mp3", waitForCompletion: false)
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -1.0)
        
        getGameData(self.gameID!)
        
        /* Setup your scene here
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)*/
        teacher = SKSpriteNode(imageNamed: self.data.playerImage)
        teacher.xScale = 0.5
        teacher.yScale = 0.5
        teacher.position = CGPoint(x:500, y:100)
        teacher.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(50, 50))
        teacher.physicsBody?.affectedByGravity = false
        teacher.physicsBody?.dynamic = false
        teacher.physicsBody?.categoryBitMask = redCategory
        teacher.physicsBody?.contactTestBitMask = greenCategory
        self.addChild(teacher)
        
        gameInfo?.border = self.data.border
        gameInfo?.stageXP = self.data.stageXP
        
        //myLabel.color = UIColor.redColor()
        myLabel.position = CGPoint(x:700,y:700)
        self.addChild(myLabel)
        
        //pointLabel.color = UIColor.blueColor()
        pointLabel.position = CGPoint(x:650,y:700)
        self.addChild(pointLabel)
        println(self.difficulty)
        
        //println(gameInfo?.timerData[gameInfo?.gameID])
        //var time : [Double] = gameInfo?.timerData[gameInfo?.gameID][]
    
        startTimer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "startTime", userInfo: nil, repeats: false)
        countDown = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countdown", userInfo: nil, repeats: true)
        
        /*if gameInfo?.difficulty > 0 {
            timer1 = NSTimer.scheduledTimerWithTimeInterval(self.data.t1, target: self, selector: "flowItem1", userInfo: nil, repeats: true)
        }
        
        if gameInfo?.difficulty > 1 {
            timer2 = NSTimer.scheduledTimerWithTimeInterval(self.data.t2, target: self, selector: "flowItem2", userInfo: nil, repeats: true)
        }
        
        if gameInfo?.difficulty > 2 {
            timer3 = NSTimer.scheduledTimerWithTimeInterval(self.data.t3, target: self, selector: "flowItem3", userInfo: nil, repeats: true)
        }
        
        
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "Timer", userInfo: nil, repeats: true)*/
    }
    
    func startTime(){
        if gameInfo?.difficulty > 0 {
            timer1 = NSTimer.scheduledTimerWithTimeInterval(self.data.t1, target: self, selector: "flowItem1", userInfo: nil, repeats: true)
        }
        
        if gameInfo?.difficulty > 1 {
            timer2 = NSTimer.scheduledTimerWithTimeInterval(self.data.t2, target: self, selector: "flowItem2", userInfo: nil, repeats: true)
        }
        
        if gameInfo?.difficulty > 2 {
            timer3 = NSTimer.scheduledTimerWithTimeInterval(self.data.t3, target: self, selector: "flowItem3", userInfo: nil, repeats: true)
        }
        
        
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "Timer", userInfo: nil, repeats: true)
    }
    
    func countdown(){
        if count <= 0 {
            countDown?.invalidate()
        }
        numLabel = SKLabelNode(text: String(count))
        numLabel.hidden = false
        numLabel.fontSize = 60
        numLabel.position = CGPoint(x:500, y:500)
        self.addChild(numLabel)
        
        println(count)
        
        var destroy = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: "disappearNum", userInfo: nil, repeats: false)
        count--
    }
    
    func disappearNum(){
        numLabel.hidden = true
    }
    
    func Timer(){
        time--
        if time < 0 {
            
            timer1?.invalidate()
            timer2?.invalidate()
            timer3?.invalidate()
            gameTimer?.invalidate()
            
            let finishLabel = SKLabelNode(text: "Finish!")
            finishLabel.fontSize = 60
            finishLabel.position = CGPoint(x:500,y:500)
            self.removeAllChildren()
            self.addChild(finishLabel)
            
            var finishScene = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "finishScene", userInfo: nil, repeats: false)
        }
        self.myLabel.text = String(self.time)
    }
    
    func finishScene(){
        time = 30
        count = 3
        gameInfo?.point = self.point
        gameInfo?.nextScene = 4
        delegate_escape!.sceneEscape(self)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            println(location)
            if(location.x < teacher.position.x){
                teacher.position.x -= self.data.playerSpeed
                println("go left")
            }else{
                teacher.position.x += self.data.playerSpeed
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
        let item1 = SKSpriteNode(imageNamed: self.data.item1)
        item1.xScale = 0.2
        item1.yScale = 0.2
        item1.position = CGPoint(x: /*500*/x_pos,y: 800)
        item1.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(70, 50))
        item1.physicsBody?.categoryBitMask = greenCategory
        item1.physicsBody?.contactTestBitMask = redCategory
        item1.name = "item1"
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

    
    func flowItem2(){
        println("flow Item 2")
        var x_pos : CGFloat = CGFloat(arc4random_uniform(375) * 2)
        let item2 : SKSpriteNode = SKSpriteNode(imageNamed: self.data.item2)
        item2.xScale = 0.2
        item2.yScale = 0.2
        item2.position = CGPoint(x: /*500*/x_pos,y: 800)
        item2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(70, 50))
        item2.physicsBody?.categoryBitMask = greenCategory
        item2.physicsBody?.contactTestBitMask = redCategory
        item2.name = "item2"
        self.addChild(item2)
    }
    
    func flowItem3(){
        var x_pos : CGFloat = CGFloat(arc4random_uniform(375) * 2)
        let item3 = SKSpriteNode(imageNamed: self.data.item3)
        item3.xScale = 0.2
        item3.yScale = 0.2
        item3.position = CGPoint(x: /*500*/x_pos,y: 800)
        item3.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(70, 50))
        item3.physicsBody?.categoryBitMask = greenCategory
        item3.physicsBody?.contactTestBitMask = redCategory
        item3.name = "item3"
        self.addChild(item3)
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
        /*println("collide")
        print("FirstBody is")
        println(firstBody)
        print("secondBody is")
        println(secondBody)*/
        println(secondBody.node?)
        if secondBody.node?.name == "item3" {
            runAction(sound3)
            point += self.data.point3
        }else if secondBody.node?.name == "item2" {
            runAction(sound2)
            point += self.data.point2
        }else {
            runAction(sound1)
            point += self.data.point1
        }
    secondBody.node?.removeFromParent()
        pointLabel.text = String(point)
    }
    }
    
    func setDifficulty (difficulty : Int){
        
        self.difficulty = difficulty
        print("difficulty =")
        println(self.difficulty)
    }
    
    func setGameID(id : Int){
        self.gameID = id
    }
    
    /*func getGameInfo(gameInfo : GameInfo) {
        self.gameInfo = gameInfo
    }*/
    
    func returnPoint() -> Int {
        return self.point
    }
    
    func getGameInfo() -> GameInfo {
        return self.gameInfo!
    }
    
    func setGameInfo(gameInfo : GameInfo) {
        self.gameInfo = gameInfo
    }
    
    func getGameData(gameId : Int){
        self.data.playerImage = gameData.playerImage[gameId]
        self.data.item1 = gameData.itemImage[gameId][0]
        self.data.item2 = gameData.itemImage[gameId][1]
        self.data.item3 = gameData.itemImage[gameId][2]
        self.data.playerSpeed = gameData.playerSpeed
        self.data.t1 = gameData.timer[gameId][0]
        self.data.t2 = gameData.timer[gameId][1]
        self.data.t3 = gameData.timer[gameId][2]
        self.data.point1 = gameData.itemPoint[gameId][0]
        self.data.point2 = gameData.itemPoint[gameId][1]
        self.data.point3 = gameData.itemPoint[gameId][2]
        self.data.border = gameData.border[gameId]
        self.data.stageXP = gameData.stageXP[gameId]
    }

}

class Data {
    var playerImage : String = ""
    var item1 : String = ""
    var item2 : String = ""
    var item3 : String = ""
    var playerSpeed : CGFloat = 0
    var t1 : Double = 0
    var t2 : Double = 0
    var t3 : Double = 0
    var point1 : Int = 0
    var point2 : Int = 0
    var point3 : Int = 0
    var border : Int = 0
    var stageXP : Float = 0
    init(){
    }
}
