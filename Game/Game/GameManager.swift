//
//  GameManager.swift
//  Game
//
//  Created by 仁木　真人 on 2014/11/22.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation

import UIKit

class GameManager : UIViewController {
    let player : Player = Player()
    let itemManager : ItemManager = ItemManager()
    var playerImage = UIImageView()
    var item1Image = UIImageView()
    var item2Image = UIImageView()
    var item3Image = UIImageView()
    var myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
    var pointLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
    
    let defaultItemPoint : CGPoint = CGPointMake(100, -30)
    let leftButton : UIButton = UIButton()
    let rightButton : UIButton = UIButton()
    var time : Int = 60
    var point : Int = 0
    
    override func viewDidLoad(){
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setPointLabel()
        
        self.setPlayerImage()
        self.setItemImage()
        
        self.setLeftButton()
        
         var timer1 = NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: "flowItem1", userInfo: nil, repeats: true)

        var timer2 = NSTimer.scheduledTimerWithTimeInterval(7.5, target: self, selector: "flowItem2", userInfo: nil, repeats: true)
        
        var timer3 = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "flowItem3", userInfo: nil, repeats: true)
        
        var gameTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "gameTimer", userInfo: nil, repeats: true)
        
        var testTimer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "testTimer", userInfo: nil, repeats: true)
        
        super.viewDidLoad()
    }
    
    func testTimer(){
        self.point += itemManager.item1.point!
        self.pointLabel.text = String(self.point)
    }
    
    func gameTimer(){
        time--
        self.myLabel.text = String(self.time)
    }
    
    func setPointLabel(){
        self.myLabel.text = String(self.time)
        self.myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        self.view.addSubview(self.myLabel)
        
        self.pointLabel.text = String(self.point)
        self.pointLabel.layer.position = CGPoint(x: self.view.bounds.width/3,y: 300)
        self.view.addSubview(self.pointLabel)
    }
    
    func flowItem1(){
        var flag : Bool = true
        var x_pos : CGFloat = CGFloat(arc4random_uniform(375))
        item1Image.center.x = x_pos
        UIView.animateWithDuration(4, animations: {self.item1Image.center.y += 800}, completion: { finished in self.item1Image.center = self.defaultItemPoint
        flag = false})
        /*while flag {
        if CGRectIntersectsRect(self.item1Image.frame, self.playerImage.frame){
            println("collide")
        }
        }*/
        
        /*var x_pos : CGFloat = CGFloat(arc4random_uniform(375))
        var y_pos : CGFloat = item1Image.center.y
        println(x_pos)
        item1Image.center.x = x_pos
        while true {
            println("loop")
            y_pos += 0.05
            item1Image.center = CGPointMake(x_pos, y_pos)
            println(item1Image.center.y)
            if item1Image.center.y > 700{
                item1Image.center.y = defaultItemPoint.y
                break
            }
        }*/
        println("flowItem1()")
        
    /*self.view.addSubview(itemManager.getImageView(itemManager.itemCounter))*/
        
    }
    
    func flowItem2(){
        var x_pos : CGFloat = CGFloat(arc4random_uniform(375))
        item2Image.center.x = x_pos
        UIView.animateWithDuration(5, animations: {self.item2Image.center.y += 800}, completion: { finished in self.item2Image.center = self.defaultItemPoint
             })
    }
    
    func flowItem3(){
        var x_pos : CGFloat = CGFloat(arc4random_uniform(375))
        item3Image.center.x = x_pos
        UIView.animateWithDuration(6, animations: {self.item3Image.center.y += 800}, completion: { finished in self.item3Image.center = self.defaultItemPoint})
    }
    
    func setItemImage(){
        item1Image = UIImageView(image: UIImage(named: "item1.jpeg"))
        item1Image.center = defaultItemPoint
        item1Image.transform = CGAffineTransformMakeScale(0.2, 0.2)
        self.view.addSubview(item1Image)
        
        item2Image = UIImageView(image: UIImage(named: "item2.jpg"))
        item2Image.center = defaultItemPoint
        item2Image.transform = CGAffineTransformMakeScale(0.2, 0.2)
        self.view.addSubview(item2Image)
        
        item3Image = UIImageView(image: UIImage(named: "item3.jpg"))
        item3Image.center = defaultItemPoint
        item3Image.transform = CGAffineTransformMakeScale(0.3, 0.4)
        self.view.addSubview(item3Image)
    }
    
    func setPlayerImage(){
        
        playerImage = UIImageView(image:player.PlayerImage)
        
        playerImage.center = CGPointMake(187.5, 600)
        playerImage.transform = CGAffineTransformMakeScale(0.3, 0.3)
        self.view.addSubview(playerImage)
    }
    
    func movePlayer(dir:CGFloat){
        playerImage.center.x += player.move(dir)
        
    }
    
    //func prepareItem(itemInfo : ItemInfo)
    
    
    func setLeftButton(){
        // サイズを設定する.
        leftButton.frame = CGRectMake(0,0,50,40)
        
        // 背景色を設定する.
        leftButton.backgroundColor = UIColor.redColor()
        
        // 枠を丸くする.
        leftButton.layer.masksToBounds = true
        
        // タイトルを設定する(通常時).
        leftButton.setTitle("Left", forState: UIControlState.Normal)
        leftButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        // タイトルを設定する(ボタンがハイライトされた時).
        leftButton.setTitle("Left", forState: UIControlState.Highlighted)
        leftButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        
        // コーナーの半径を設定する.
        leftButton.layer.cornerRadius = 20.0
        
        // ボタンの位置を指定する.
        leftButton.layer.position = CGPoint(x: self.view.frame.width/4, y:30)
        
        // タグを設定する.
        leftButton.tag = 1
        
        // イベントを追加する.
        leftButton.addTarget(self, action: "onClickLeftButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(leftButton)
        
        
        // サイズを設定する.
        rightButton.frame = CGRectMake(0,0,50,40)
        
        // 背景色を設定する.
        rightButton.backgroundColor = UIColor.redColor()
        
        // 枠を丸くする.
        rightButton.layer.masksToBounds = true
        
        // タイトルを設定する(通常時).
        rightButton.setTitle("Right", forState: UIControlState.Normal)
        rightButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        // タイトルを設定する(ボタンがハイライトされた時).
        rightButton.setTitle("Right", forState: UIControlState.Highlighted)
        rightButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        
        // コーナーの半径を設定する.
        rightButton.layer.cornerRadius = 20.0
        
        // ボタンの位置を指定する.
        rightButton.layer.position = CGPoint(x: self.view.frame.width*3/4, y:30)
        
        // タグを設定する.
        rightButton.tag = 1
        
        // イベントを追加する.
        rightButton.addTarget(self, action: "onClickRightButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(rightButton)
    }
    
    func onClickLeftButton(sender: UIButton){
        println("onClickLeftButton:")
        println("sender.currentTitile: \(sender.currentTitle)")
        println("sender.tag:\(sender.tag)")
        movePlayer(-1)
        
    }
    
    func onClickRightButton(sender: UIButton){
        println("onClickLeftButton:")
        println("sender.currentTitile: \(sender.currentTitle)")
        println("sender.tag:\(sender.tag)")
        movePlayer(1)
        
    }

}