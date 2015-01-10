//
//  ProfileScene.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/10.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class ProfileScene : SKScene{
    
    var delegate_escape: SceneEscapeProtocol?
    var gameInfo : GameInfo?
    
    var movie : SKVideoNode = SKVideoNode()
    var profile : SKSpriteNode = SKSpriteNode()

    let playLabel : SKLabelNode = SKLabelNode(text: "play")
    let stopLabel : SKLabelNode = SKLabelNode(text: "stop")
    var stop : Bool = true
    var profid : Int = 0
    
    let video : [String] = ["movie1.mp4","movie2.mp4","movie3.mp4","movie4.mp4","movie5.mp4","movie6.mp4","movie7.mp4","movie8.mp4","movie9.mp4"]
    let data : [String] = ["data1.jpg","data2.png","data3.png","data4.png","data5.png","data6.png","data7.png","data8.png","data9.png"]
    
    override func didMoveToView(view: SKView) {
        
        
        
        loadDataFromId()
        
        movie.position = CGPoint(x:500, y:500)
        self.addChild(movie)
        
        playLabel.position = CGPoint(x:450, y:700)
        self.addChild(playLabel)
        
        stopLabel.position = CGPoint(x:550, y:700)
        self.addChild(stopLabel)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if playLabel.containsPoint(location) {
                stop = false
                movie.play()
            } else if stopLabel.containsPoint(location) {
                movie.pause()
            }
        }
    }
    
    func setProfId(id : Int){
        self.profid = id
    }
    
    func loadDataFromId(){
        self.movie = SKVideoNode(videoFileNamed: video[profid])
        self.profile = SKSpriteNode(fileNamed: data[profid])
    }
    
    func setGameInfo(gameInfo : GameInfo) {
        self.gameInfo = gameInfo
    }
    
}