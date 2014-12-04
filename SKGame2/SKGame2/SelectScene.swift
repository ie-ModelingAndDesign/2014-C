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
        
        /* Setup your scene here */
        /*let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "最初の画面";
        myLabel.fontSize = 40;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)*/
    }

    // タップしたら、sceneEscapeを呼ぶようにする。
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            println(location)
            
            if menu1.containsPoint(location) {
                
                self.difficulty = 1
                delegate_escape!.sceneEscape(self)
            } else if menu2.containsPoint(location) {
                self.difficulty = 2
                delegate_escape!.sceneEscape(self)
            } else if menu3.containsPoint(location) {
                self.difficulty = 3
                delegate_escape!.sceneEscape(self)
            }
            
        //delegate_escape!.sceneEscape(self)
        }
    }
    
    func getDifficulty() -> Int{
        return self.difficulty
    }
    
    /*func getGameInfo(gameInfo : GameInfo) {
        self.gameInfo = gameInfo
    }*/
}