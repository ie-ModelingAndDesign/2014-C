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
        
    var menu1 : SKSpriteNode = SKSpriteNode(imageNamed: "item1.jpeg")//あとでボタン画像に差し替え
    var menu2 : SKSpriteNode = SKSpriteNode(imageNamed: "item2.jpg")
    var menu3 : SKSpriteNode = SKSpriteNode(imageNamed: "item3.jpg")
    
    var level : SKLabelNode = SKLabelNode()
    var money : SKLabelNode = SKLabelNode()
    
    var currentPage : Int = 1
    var gameID : Int = 0
    var gameInfo : GameInfo?
    
    var difficulty : Int = 1
    
    var dialog : CustomDialog!
    
    override func didMoveToView(view: SKView) {
        
        var l : SKLabelNode = SKLabelNode(text: "学年::")
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
        
        menu2.xScale = 1.2
        menu2.yScale = 0.5
        menu2.position = CGPoint(x:500,y:400)
        self.addChild(menu2)
        
        menu3.xScale = 1.2
        menu3.yScale = 0.5
        menu3.position = CGPoint(x:500,y:200)
        self.addChild(menu3)
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            println(location)
            
            if menu1.containsPoint(location) {//1番目の先生
                // カスタムダイアログを生成.
                gameInfo?.difficulty = 1
                gameInfo?.nextScene = 3
                self.gameID = 0//ここで先生を指定
                dialog = CustomDialog(id:self.gameID , scene: self, frame:CGRectMake(0, 0, self.view!.bounds.maxX - 50, 300), seaneESCP: delegate_escape!)
                self.view!.addSubview(dialog)
                
            } else if menu2.containsPoint(location) {
                gameInfo?.difficulty = 1
                gameInfo?.nextScene = 3
                self.gameID = 1//ここで先生を指定
                dialog = CustomDialog(id:self.gameID , scene: self, frame:CGRectMake(0, 0, self.view!.bounds.maxX - 50, 300), seaneESCP: delegate_escape!)
                self.view!.addSubview(dialog)
            } else if menu3.containsPoint(location) {
                gameInfo?.difficulty = 1
                gameInfo?.nextScene = 3
                self.gameID = 2//ここで先生を指定
                dialog = CustomDialog(id:self.gameID , scene: self, frame:CGRectMake(0, 0, self.view!.bounds.maxX - 50, 300), seaneESCP: delegate_escape!)
                self.view!.addSubview(dialog)
            }
        }
    }
    
    
    func getDifficulty() -> Int{
        println("selectScene's difficulty")
        println(self.difficulty)
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