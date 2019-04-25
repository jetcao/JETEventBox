//
//  SecondViewController.swift
//  EventBoxDemo
//
//  Created by gaodun on 2019/4/21.
//  Copyright © 2019年 gaodun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var eventController = JETEventController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eventController.addEvent(Key.NotificationKey.ByeBye, true) { (paramters) in
            print("👋👋👋")
            print(paramters ?? "自动释放观察者")
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        JETEventController.trigggerEvent(Key.NotificationKey.ByeBye)
        self.navigationController?.popViewController(animated: true)
    }
}
