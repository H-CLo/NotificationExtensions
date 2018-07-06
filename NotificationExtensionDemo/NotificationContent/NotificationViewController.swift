//
//  NotificationViewController.swift
//  NotificationContent
//
//  Created by Hung Chang Lo on 2018/7/6.
//  Copyright © 2018年 Hung Chang Lo. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

/**
  your view controller will not receive any touch events when being displayed to the user. This means that your view controller should not include any interface elements the user would expect to be able to interact with including buttons, switches, sliders, etc. Please note that you can still include items such as UITableViews and UIScrollViews in your interface and scroll them programmatically if your content doesn't fit within the whole interface.
 
  The only exception to this is that, if your interface contains some sort of media associated with the notification, you can ask the system to display a media play/pause button. 
 
 */

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        
        self.label?.text = notification.request.content.body
    }
}
