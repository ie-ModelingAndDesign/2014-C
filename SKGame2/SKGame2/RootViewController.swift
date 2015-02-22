//
//  RootViewController.swift
//  RapMushi
//
//  Created by Nozomi Teruya on 2014/10/25.
//  Copyright (c) 2014年 Dpop420. All rights reserved.
//

import SpriteKit
import UIKit
import AVFoundation

class RootViewController: UIViewController {
    var playButton : [UIButton?] = []
    var myImageView: UIImageView = UIImageView(frame: CGRectMake(60, 30, 200, 200))
    
    var playFlag = 0;
    var i = 0;
    
    var audioPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.myImageView.image = UIImage(named: "top.jpg")
        self.view.addSubview(myImageView)
        
        while i < 8 {
            initButton()
            i++
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initButton(){
        var button: UIButton? = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        self.playButton.append(button)
        
        self.playButton[i]!.frame = CGRectMake((CGFloat)(60 + 80 * (i % 3)), (CGFloat)(250 + 60 * (i / 3)), 50, 50)
        self.playButton[i]!.setTitle("0" + String(i), forState: .Normal)
        self.playButton[i]!.addTarget(self, action: "pushedPlayButton:", forControlEvents: .TouchUpInside)
        self.playButton[i]!.setImage(UIImage(named: "img" + String(i) + ".jpg"), forState: .Normal)
        
        self.view.addSubview(playButton[i]!)
    }
    
    func pushedPlayButton(sender: UIButton){
        //buttonを押された時の挙動
        
        let dialog = CustomDialog(scene: self, frame:CGRectMake(0, 0, self.view!.bounds.maxX - 50, 300))
        self.view!.addSubview(dialog)

        
        println("button pushed!")
        /*
        self.myImageView.image = UIImage(named: sender.currentTitle! + ".jpg");
        
        var path : String = NSBundle.mainBundle().pathForResource(sender.currentTitle!, ofType: "wav")!//指定したリソースのパスを取得
        var url : NSURL = NSURL.fileURLWithPath(path)!//NSURLに変換？
        var error : NSError?
        self.audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)//ラップの中に値を入れている
        
        if (error != nil) {
            return
        }
        
        self.audioPlayer!.volume = 0.5
        self.audioPlayer!.play()*/
        
    }
    
}

