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
    var moneyLabel = SKLabelNode(fontNamed: "Chalkduster")

    
    var success : SKAction = SKAction.playSoundFileNamed("success.mp3", waitForCompletion: false)
    var fault : SKAction = SKAction.playSoundFileNamed("fault.mp3", waitForCompletion: false)
    
    override func didMoveToView(view: SKView) {
        
        let mLabel = SKLabelNode(fontNamed:"Chalkduster")
        mLabel.text = "money:"
        mLabel.fontSize = 40;
        mLabel.position = CGPoint(x:CGRectGetMidX(self.frame)-100, y:CGRectGetMidY(self.frame));
        self.addChild(mLabel)
        
        moneyLabel.position = CGPoint(x:CGRectGetMidX(self.frame)+30, y:CGRectGetMidY(self.frame));
        moneyLabel.fontSize = 40;
        self.addChild(moneyLabel)
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Point:";
        myLabel.fontSize = 40;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame)-100, y:CGRectGetMidY(self.frame)+200);
        self.addChild(myLabel)
        
        let pointLabel = SKLabelNode(fontNamed: "Chalkduster")
        var score = gameInfo?.point
        pointLabel.text = String(score!)
        pointLabel.fontSize = 40;
        pointLabel.position = CGPoint(x:CGRectGetMidX(self.frame)+30 , y:CGRectGetMidY(self.frame)+200);
        self.addChild(pointLabel)
        
        let statusLabel = SKLabelNode(fontNamed: "Chalkduster")
        
        if gamePoint >= gameInfo?.border {
            var m = gameInfo?.getMoney(1)
            moneyLabel.text =  String(m!)
            runAction(success)
            statusLabel.text = "勝ち"
        }else {
            var m = gameInfo?.getMoney(0)
            moneyLabel.text = String(m!)
            runAction(fault)
            statusLabel.text = "負け"
        }
        statusLabel.fontSize = 40
        statusLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 150);
        self.addChild(statusLabel)
      
        backLabel.text = "戻る"
        backLabel.fontSize = 40
        backLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 270);
        self.addChild(backLabel)
        
        retryLabel.text = "もう一度"
        retryLabel.fontSize = 40
        retryLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 330);
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