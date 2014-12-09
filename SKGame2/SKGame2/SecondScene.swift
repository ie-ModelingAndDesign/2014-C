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
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Point:";
        myLabel.fontSize = 40;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(myLabel)
        
        let pointLabel = SKLabelNode(fontNamed: "Chalkduster")
        var score = gameInfo?.point
        pointLabel.text = String(score!)
        pointLabel.fontSize = 40;
        pointLabel.position = CGPoint(x:CGRectGetMidX(self.frame) + 120, y:CGRectGetMidY(self.frame));
        self.addChild(pointLabel)
        
        let statusLabel = SKLabelNode(fontNamed: "Chalkduster")
        
        if gamePoint >= gameInfo?.border {
            statusLabel.text = "勝ち"
        }else {
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