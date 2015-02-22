//
//  GameViewController.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/03.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, SceneEscapeProtocol {
    
    var skView: SKView?
    
    let ud = NSUserDefaults.standardUserDefaults()
    
    var gameInfo : GameInfo = GameInfo()
    var selectScene : SelectScene = SelectScene()
    var selectScene2 : SelectScene2 = SelectScene2()
    var selectScene3 : SelectScene3 = SelectScene3()
    var gameScene : GameScene? = GameScene()
    var secondScene :SecondScene = SecondScene()
    var initScene : InitScene = InitScene()
    var profileScene : ProfileScene = ProfileScene()
    var flag : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.skView = self.view as? SKView
        skView!.showsFPS = true
        skView!.showsNodeCount = true
        skView!.ignoresSiblingOrder = true
        
        if loadInfo() == 1 {
            flag = 1
            goInit()
        } else {
            flag = 0
            goInit()
        }
    }
    
    
    
    func goProfile() {
        profileScene = ProfileScene(size: CGSizeMake(1024, 768))
        profileScene.delegate_escape = self
        profileScene.scaleMode = SKSceneScaleMode.AspectFill
        self.skView!.presentScene(profileScene)
    }
    
    func goInit() {
        initScene = InitScene(size: CGSizeMake(1024, 768))
        initScene.setGameInfo(self.gameInfo)
        initScene.delegate_escape = self
        initScene.scaleMode = SKSceneScaleMode.AspectFill
        if flag == 0{initScene.setText()}
        self.skView!.presentScene(initScene)
    }
    
    func goSelect() {
        selectScene = SelectScene(size: CGSizeMake(1024, 768))
        selectScene.setGameInfo(self.gameInfo)
        selectScene.delegate_escape = self
        selectScene.scaleMode = SKSceneScaleMode.AspectFill
        self.skView!.presentScene(selectScene)
    }
    
    func goSelect2() {
        selectScene2 = SelectScene2(size: CGSizeMake(1024, 768))
        selectScene2.setGameInfo(self.gameInfo)
        selectScene2.delegate_escape = self
        selectScene2.scaleMode = SKSceneScaleMode.AspectFill
        self.skView!.presentScene(selectScene2)
    }
    
    func goSelect3() {
        selectScene3 = SelectScene3(size: CGSizeMake(1024, 768))
        selectScene3.setGameInfo(self.gameInfo)
        selectScene3.delegate_escape = self
        selectScene3.scaleMode = SKSceneScaleMode.AspectFill
        self.skView!.presentScene(selectScene3)
    }
    
    func goGame() {
        gameScene = GameScene(size: CGSizeMake(1024, 768))
        gameScene!.setGameInfo(self.gameInfo)
        gameScene!.setDifficulty(selectScene.getDifficulty())
        gameScene!.setGameID(selectScene.getGameId())
        gameScene!.delegate_escape = self
        gameScene!.scaleMode = SKSceneScaleMode.AspectFill
        self.skView!.presentScene(gameScene)
    }
    
    func goSecond() {
        secondScene = SecondScene(size: CGSizeMake(1024, 768))
        secondScene.setGameInfo(self.gameInfo)
        secondScene.getPoint(gameScene!.returnPoint())
        saveData()
        secondScene.delegate_escape = self
        secondScene.scaleMode = SKSceneScaleMode.AspectFill
        self.skView!.presentScene(secondScene)
    }
    
    func loadInfo() -> Int {
        println("NSUserDefaults is working")
        let defaults = NSUserDefaults.standardUserDefaults()
        var data : [Int] = []
        if (defaults.objectForKey("data") != nil){
            println("getting Defaults data")
            let objects = defaults.objectForKey("data") as? NSArray
            var datas:AnyObject
            for datas in objects!{
                data.append(datas as NSInteger)
            }
            gameInfo.locked = data[0]
            gameInfo.playerLevel = data[1]
            gameInfo.money = Int(data[2])
            return 1
        }
        return 0
    }
    
    func saveData(){
        
        var datas : [Int] = []
        
        println("save data in core")
        println(gameInfo.locked)
        println(gameInfo.playerLevel)
        println(gameInfo.money)
        
        datas.append(self.gameInfo.locked)
        datas.append(self.gameInfo.playerLevel)
        datas.append(Int(self.gameInfo.money))
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(datas, forKey:"data")
        defaults.synchronize()
    }
        
    func sceneEscape(scene: SKScene) {
                
        if scene.isKindOfClass(GameScene) {
            self.gameInfo = gameScene!.getGameInfo()
            if gameInfo.nextScene == 4{
                goSecond()
            }
        } else if scene.isKindOfClass(SecondScene) {
            self.gameInfo = secondScene.getGameInfo()
            if gameInfo.nextScene == 2 {
                goSelect()
            } else if gameInfo.nextScene == 3 {
                goGame()
            }
        } else if scene.isKindOfClass(SelectScene){
            println("in sceneEscape");
            self.gameInfo = selectScene.getGameInfo()
            goGame()
            /*if gameInfo.nextScene == 3 {
                goGame()
            } else if gameInfo.nextScene == 1 {
                goInit()
            } else if gameInfo.nextScene == 5 {
                goSelect2()
            } else if gameInfo.nextScene == 7 {
                goProfile()
            }*/
        } else if scene.isKindOfClass(InitScene){
            self.gameInfo = initScene.getGameInfo()
            goSelect()
        } else if scene.isKindOfClass(SelectScene2){
            self.gameInfo = selectScene2.getGameInfo()
            if gameInfo.nextScene == 2 {
                goSelect()
            } else if gameInfo.nextScene == 6 {
                goSelect3()
            }
        } else if scene.isKindOfClass(SelectScene3){
            self.gameInfo = selectScene3.getGameInfo()
            if gameInfo.nextScene == 5 {
                goSelect2()
            }
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

}
