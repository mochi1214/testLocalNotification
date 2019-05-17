//
//  ViewController.swift
//  testLocalNotification
//
//  Created by 金融研發一部-吳佳臻 on 2019/5/16.
//  Copyright © 2019 金融研發一部-吳佳臻. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 點擊建立通知按鈕
        let createNotificationBtn: UIButton = UIButton()
        createNotificationBtn.frame = CGRect(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 25, width: 200, height: 50)
        createNotificationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        createNotificationBtn.setTitle("按下推播通知", for: .normal)
        createNotificationBtn.setTitleColor(UIColor.white, for: .normal)
        createNotificationBtn.layer.cornerRadius = 10
        createNotificationBtn.backgroundColor = UIColor.darkGray
        createNotificationBtn.addTarget(self, action: #selector(ViewController.onClickCreateNotificationBtn(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(createNotificationBtn)
    }
    
    
    @objc func onClickCreateNotificationBtn(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "測試本地通知"
        content.subtitle = "本地推播練習"
        content.body = "推播成功"
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        //設置推播通知圖片
        let imageURL: URL = Bundle.main.url(forResource: "capoo", withExtension: "jpg")!
        let attachment = try! UNNotificationAttachment(identifier: "image", url: imageURL, options: nil)
        content.attachments = [attachment]
        
        //點擊推播通知後取得的資訊
        content.userInfo = ["link" : "https://www.facebook.com/chiachen.wu.319"]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            print("成功建立通知...")
        })
    }
    
   


}

