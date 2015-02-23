//
//  SecondScene.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/04.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import SpriteKit

class SecondScene: SKScene {
    
    var delegate_escape: SceneEscapeProtocol?
    
    var gamePoint :Int = 0
    var gameInfo : GameInfo?
    
    let backLabel = SKLabelNode(fontNamed: "Chalkduster")
    let retryLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    var success : SKAction = SKAction.playSoundFileNamed("success.mp3", waitForCompletion: false)
    var fault : SKAction = SKAction.playSoundFileNamed("fault.mp3", waitForCompletion: false)
    
    override func didMoveToView(view: SKView) {
        let myLabel = SKLabelNode(fontNamed:"Hiragino Maru Gothic Pro")
        myLabel.text = "Point:";
        myLabel.fontSize = 50;
        myLabel.position = CGPoint(x:450, y:CGRectGetMidY(self.frame)+200);
        
        let pointLabel = SKLabelNode(fontNamed: "Hiragino Maru Gothic Pro")
        var score = gameInfo?.point
        pointLabel.text = String(score!)
        pointLabel.fontSize = 50;
        pointLabel.position = CGPoint(x:600 , y:CGRectGetMidY(self.frame)+200);
        
        var statusLabel = SKLabelNode(fontNamed: "Chalkduster")
        
        if gamePoint >= gameInfo?.border {
            //背景指定
            let sprBG : SKSpriteNode = SKSpriteNode(imageNamed:"background_good.png")
            sprBG.position = CGPointMake(self.frame.size.width*0.53, self.frame.size.height*0.5)
            self.addChild(sprBG)
            runAction(success)
            
            statusLabel.text = "単位取得！"
            statusLabel.fontName = "HiraKakuProN-W3"
            statusLabel.fontColor = SKColor.blueColor();
            
            myLabel.fontColor = SKColor.blueColor();
            self.addChild(myLabel)
            
            pointLabel.fontColor = SKColor.blueColor();
            self.addChild(pointLabel)
            
            backLabel.fontColor = SKColor.blueColor();
            retryLabel.fontColor = SKColor.blueColor();


        }else {
            //背景指定
            let sprBG : SKSpriteNode = SKSpriteNode(imageNamed:"background_bad.png")
            sprBG.position = CGPointMake(self.frame.size.width*0.53, self.frame.size.height*0.5)
            self.addChild(sprBG)
            runAction(fault)
            statusLabel.text = "留年"
            
            statusLabel.fontColor = SKColor.yellowColor();
            
            myLabel.fontColor = SKColor.yellowColor();
            self.addChild(myLabel)
            
            pointLabel.fontColor = SKColor.yellowColor();
            self.addChild(pointLabel)
            
            backLabel.fontColor = SKColor.yellowColor();
            retryLabel.fontColor = SKColor.yellowColor();
        }
        statusLabel.fontSize = 80
        statusLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(statusLabel)
      
        backLabel.text = "メニューに戻る"
        backLabel.fontSize = 40
        backLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 220);
        self.addChild(backLabel)
        
        retryLabel.text = "もう一度"
        retryLabel.fontSize = 40
        retryLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 300);
        self.addChild(retryLabel)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches {
        
        let location = touch.locationInNode(self)
        
        if backLabel.containsPoint(location) {
            gameInfo?.nextScene = 2
            delegate_escape!.sceneEscape(self)
        } else if retryLabel.containsPoint(location){
            gameInfo?.nextScene = 3
            delegate_escape?.sceneEscape(self)
            }
        }
    }
    
    func getPoint(point:Int){
        self.gamePoint = point
    }
    
    func getGameInfo() -> GameInfo {
        return self.gameInfo!
    }
    
    func setGameInfo(gameInfo : GameInfo) {
        self.gameInfo = gameInfo
    }
}