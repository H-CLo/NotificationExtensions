//
//  ViewController.swift
//  NotificationExtensionDemo
//
//  Created by Hung Chang Lo on 2018/7/5.
//  Copyright © 2018年 Hung Chang Lo. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createLocalNotificationButtonDidPushed(_ sender: UIButton) {
        
        createLocalNotification()
    }
    func createLocalNotification() -> Void {
        
        let center = UNUserNotificationCenter.current()
        
        // setup category
        let categoryId = "tw.hungclo.notification.categoryId"
        
        // setup custom action with categoryId
        // 備註：action options 必須設定 .foreground才會自動打開App
        let action = UNNotificationAction(identifier: "testButton", title: "Tap me!!!", options: [.foreground])
        let action1 = UNNotificationAction(identifier: "testButton", title: "Don't tap!!!", options: [])
        let category = UNNotificationCategory(identifier: categoryId, actions: [action, action1], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        
        // setup content
        let newContent = UNNotificationContent()
        //newContent.title = "123"
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = categoryId
        content.title = "title：測試本地通知"
        content.subtitle = "subtitle：威力"
        content.body = "威力的測試推播來嘍"
        content.badge = 1
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        center.add(request, withCompletionHandler: {error in
            print("成功建立通知...")
        })
    }

}

