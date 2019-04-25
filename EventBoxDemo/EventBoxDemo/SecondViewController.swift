//
//  SecondViewController.swift
//  EventBoxDemo
//
//  Created by jet on 2019/4/21.
//  Copyright © 2019年 jet. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var eventController = EventController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eventController.addEvent(Key.NotificationKey.ByeBye, true) { (paramters) in
            print("👋👋👋")
            print(paramters ?? "自动释放观察者")
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        EventController.trigggerEvent(Key.NotificationKey.ByeBye)
        self.navigationController?.popViewController(animated: true)
    }
}
