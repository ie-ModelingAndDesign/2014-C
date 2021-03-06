//
//  SelectScene2.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/10.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class SelectScene2: SKScene{
    
    var delegate_escape: SceneEscapeProtocol?
    
    var menu1 : SKSpriteNode = SKSpriteNode(imageNamed: "img1.jpg")
    var menu2 : SKSpriteNode = SKSpriteNode(imageNamed: "img2.jpg")
    var menu3 : SKSpriteNode = SKSpriteNode(imageNamed: "img3.jpg")
    
    var up : SKSpriteNode = SKSpriteNode(imageNamed: "item2.jpg")
    var down : SKSpriteNode = SKSpriteNode(imageNamed: "item2.jpg")
    
    var currentPage : Int = 1
    
    var gameInfo : GameInfo?
    
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
        
        var ein : SKSpriteNode = SKSpriteNode(imageNamed: "ein.jpg")
        ein.alpha = 0.6
        ein.xScale = 2.0
        ein.yScale = 0.6
        
        if gameInfo?.locked < 4 {
            var ein1 : SKSpriteNode = SKSpriteNode(imageNamed: "ein.jpg")
            ein1.alpha = 0.3
            ein1.xScale = 2.0
            ein1.yScale = 0.6
            ein1.position = CGPoint(x:500,y:600)
            self.addChild(ein1)
        }
        if gameInfo?.locked < 5 {
            var ein2 : SKSpriteNode = SKSpriteNode(imageNamed: "ein.jpg")
            ein2.alpha = 0.3
            ein2.xScale = 2.0
            ein2.yScale = 0.6
            ein2.position = CGPoint(x:500,y:400)
            self.addChild(ein2)
        }
        if gameInfo?.locked < 6 {
            var ein3 : SKSpriteNode = SKSpriteNode(imageNamed: "ein.jpg")
            ein3.alpha = 0.3
            ein3.xScale = 2.0
            ein3.yScale = 0.6
            ein3.position = CGPoint(x:500,y:200)
            self.addChild(ein3)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent    event: UIEvent) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            println(location)
            
            if menu1.containsPoint(location) {
                
                gameInfo?.difficulty = 3
                gameInfo?.nextScene = 3
                gameInfo?.gameID = 3
                delegate_escape!.sceneEscape(self)
            } else if menu2.containsPoint(location) {
                gameInfo?.difficulty = 3
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
            
            
            
        }
    }
    
    
    func getDifficulty() -> Int{
        return self.difficulty
    }
    
    func getGameInfo() -> GameInfo {
        return self.gameInfo!
    }
    
    func setGameInfo(gameInfo : GameInfo) {
        self.gameInfo = gameInfo
    }
    
}