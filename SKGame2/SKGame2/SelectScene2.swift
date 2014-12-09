//
//  SelectScene2.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/10.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import SpriteKit

class SelectScene2: SKScene {
    
    var delegate_escape: SceneEscapeProtocol?
    
    var menu1 : SKSpriteNode = SKSpriteNode(imageNamed: "img1.jpg")
    var menu2 : SKSpriteNode = SKSpriteNode(imageNamed: "img2.jpg")
    var menu3 : SKSpriteNode = SKSpriteNode(imageNamed: "img3.jpg")
    
    var up : SKSpriteNode = SKSpriteNode(imageNamed: "item2.jpg")
    var down : SKSpriteNode = SKSpriteNode(imageNamed: "item2.jpg")
    
    var currentPage : Int = 1
    
    var gameInfo : GameInfo?
    
    //var test : SKSpriteNode = SKSpriteNode(imageNamed: "item3.jpg")
    
    var difficulty : Int = 1
    
    override func didMoveToView(view: SKView) {
        
        menu1.xScale = 1.2
        menu1.yScale = 0.5
        menu1.position = CGPoint(x:500,y:600)
        self.addChild(menu1)
        
        menu2.xScale = 1.2
        menu2.yScale = 0.5
        menu2.position = CGPoint(x:500,y:400)
        self.addChild(menu2)
        
        menu3.xScale = 1.2
        menu3.yScale = 0.5
        menu3.position = CGPoint(x:500,y:200)
        self.addChild(menu3)
        
        up.xScale = 0.3
        up.yScale = 0.3
        up.position = CGPoint(x:700,y:700)
        self.addChild(up)
        
        down.xScale = 0.3
        down.yScale = 0.3
        down.position = CGPoint(x:700,y:150)
        self.addChild(down)
        
        /*test.xScale = 0.5
        test.yScale = 0.8
        test.position = CGPoint(x:400,y:600)
        self.addChild(test)*/
        
        /* Setup your scene here */
        /*let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "最初の画面";
        myLabel.fontSize = 40;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)*/
    }
    
    override func touchesBegan(touches: NSSet, withEvent    event: UIEvent) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            println(location)
            
            if menu1.containsPoint(location) {
                
                gameInfo?.difficulty = 1
                gameInfo?.nextScene = 3
                delegate_escape!.sceneEscape(self)
            } else if menu2.containsPoint(location) {
                gameInfo?.difficulty = 2
                gameInfo?.nextScene = 3
                delegate_escape!.sceneEscape(self)
            } else if menu3.containsPoint(location) {
                gameInfo?.difficulty = 3
                gameInfo?.nextScene = 3
                delegate_escape!.sceneEscape(self)
            } else if up.containsPoint(location) {
                gameInfo?.nextScene = 2
                delegate_escape!.sceneEscape(self)
            } else if down.containsPoint(location) {
                gameInfo?.nextScene = 6
                delegate_escape!.sceneEscape(self)
            }
            
            
            
            //delegate_escape!.sceneEscape(self)
        }
    }
    
    /*func changeView(page : Int){
    if page == 1 {
    menu1 = SKSpriteNode(imageNamed: "item1.jpeg")
    menu2 = SKSpriteNode(imageNamed: "item2.jpg")
    menu3 = SKSpriteNode(imageNamed: "item3.jpg")
    
    up = SKSpriteNode(imageNamed: "item1.jpeg")
    down = SKSpriteNode(imageNamed: "item2.jpg")
    } else if page == 2 {
    menu1 = SKSpriteNode(imageNamed: "img1.jpg")
    menu2 = SKSpriteNode(imageNamed: "img2.jpg")
    menu3 = SKSpriteNode(imageNamed: "img3.jpg")
    
    up = SKSpriteNode(imageNamed: "item2.jpg")
    down = SKSpriteNode(imageNamed: "item2.jpg")
    } else if page == 3 {
    menu1 = SKSpriteNode(imageNamed: "img4.jpg")
    menu2 = SKSpriteNode(imageNamed: "img5.jpg")
    menu3 = SKSpriteNode(imageNamed: "img6.jpg")
    
    up = SKSpriteNode(imageNamed: "item2.jpg")
    down = SKSpriteNode(imageNamed: "item1.jpeg")
    }
    }*/
    
    /*override func touchesMoved(touches: NSSet, withEvent event: UIEvent){
    for touch: AnyObject in touches {
    
    let location = touch.locationInNode(self)
    if test.containsPoint(location) {
    test.position = location
    }
    }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent){
    for touch: AnyObject in touches {
    let location = touch.locationInNode(self)
    
    }
    }*/
    
    func getDifficulty() -> Int{
        return self.difficulty
    }
    
    func getGameInfo() -> GameInfo {
        return self.gameInfo!
    }
    
    func setGameInfo(gameInfo : GameInfo) {
        self.gameInfo = gameInfo
    }
    
    /*func getGameInfo(gameInfo : GameInfo) {
    self.gameInfo = gameInfo
    }*/
}