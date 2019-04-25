//
//  ViewController.swift
//  EventBoxDemo
//
//  Created by gaodun on 2019/4/21.
//  Copyright © 2019年 gaodun. All rights reserved.
//

import UIKit

struct Key {
    struct NotificationKey {
        static let Welcome = "kWelcomeNotif"
        static let WelcomeOnce = "kWelcomeOnceNotif"
        static let ByeBye = "kByeByeNotif"
    }
}

class ViewController: UIViewController {
    var eventController = JETEventController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eventController.addEvent(Key.NotificationKey.Welcome, true) { (paramters) in
            print("😁😁😁")
            print(paramters ?? "参数为空")
        }
        eventController.addEvent(Key.NotificationKey.WelcomeOnce, false) { (paramters) in
            print("😌😌😌"+"一旦触发事件，立马释放事件，回调只会走一次")
            print(paramters ?? "参数为空")
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        JETEventController.trigggerEvent(Key.NotificationKey.Welcome, parameters: ["参数":""])
        JETEventController.trigggerEvent(Key.NotificationKey.WelcomeOnce)
        JETEventController.trigggerEvent(Key.NotificationKey.WelcomeOnce)
    }
}



