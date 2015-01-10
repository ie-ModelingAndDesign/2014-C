//
//  SelectScene.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/04.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import SpriteKit

class SelectScene: SKScene {
    
    var delegate_escape: SceneEscapeProtocol?
        
    var menu1 : SKSpriteNode = SKSpriteNode(imageNamed: "item1.jpeg")
    var menu2 : SKSpriteNode = SKSpriteNode(imageNamed: "item2.jpg")
    var menu3 : SKSpriteNode = SKSpriteNode(imageNamed: "item3.jpg")
    
    var menu4 : SKSpriteNode = SKSpriteNode(imageNamed: "item1.jpeg")
    
    var up : SKSpriteNode = SKSpriteNode(imageNamed: "item1.jpeg")
    var down : SKSpriteNode = SKSpriteNode(imageNamed: "item2.jpg")
    var level : SKLabelNode = SKLabelNode()
    var money : SKLabelNode = SKLabelNode()
    
    var currentPage : Int = 1
    var gameID : Int = 0
    var gameInfo : GameInfo?
    
    var difficulty : Int = 1
    
    override func didMoveToView(view: SKView) {
        
        var l : SKLabelNode = SKLabelNode(text: "level::")
        l.position = CGPoint(x: 350, y: 700)
        self.addChild(l)
        
        var m : SKLabelNode = SKLabelNode(text: "money::")
        m.position = CGPoint(x: 500, y: 700)
        self.addChild(m)
        
        level.position = CGPoint(x:400,y:700)
        self.addChild(level)
        
        money.position = CGPoint(x:600,y:700)
        self.addChild(money)
        
        menu1.xScale = 1.2
        menu1.yScale = 0.5
        menu1.position = CGPoint(x:500,y:600)
        self.addChild(menu1)
        menu4.xScale = 0.3
        menu4.yScale = 0.3
        menu4.position = CGPoint(x:650,y:600)
        self.addChild(menu4)
        
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
            }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            println(location)
            
            if menu1.containsPoint(location) {
                if(gameInfo?.money >= 100){
                    gameInfo?.money -= 100
                    gameInfo?.difficulty = 1
                    gameInfo?.nextScene = 3
                    self.gameID = 0
                    delegate_escape!.sceneEscape(self)
                }
            } else if menu2.containsPoint(location) {
                if(gameInfo?.money >= 300){
                    gameInfo?.money -= 300
                gameInfo?.difficulty = 2
                gameInfo?.nextScene = 3
                self.gameID = 1
                delegate_escape!.sceneEscape(self)
                }
            } else if menu3.containsPoint(location) {
                if(gameInfo?.money >= 500){
                    gameInfo?.money -= 500
                gameInfo?.difficulty = 3
                gameInfo?.nextScene = 3
                self.gameID = 2
                delegate_escape!.sceneEscape(self)
                }
            } else if down.containsPoint(location) {
                gameInfo?.nextScene = 5
                delegate_escape!.sceneEscape(self)
            } else if menu4.containsPoint(location) {
                gameInfo?.gameID = 0
                gameInfo?.nextScene = 7
                delegate_escape!.sceneEscape(self)
            }
        }
    }
    
    
    func getDifficulty() -> Int{
        return self.difficulty
    }
    
    func getGameId() -> Int {
        return self.gameID
    }
    
    func getGameInfo() -> GameInfo {
        return self.gameInfo!
    }
    
    func setGameInfo(gameInfo : GameInfo) {
        self.gameInfo = gameInfo
        level.text = String(gameInfo.playerLevel)
        money.text = String(gameInfo.money)
    }
    
}