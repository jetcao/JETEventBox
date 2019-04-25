//
//  EventController.swift
//  EventController
//
//  Created by jet on 2019/3/19.
//  Copyright © 2019年 jet. All rights reserved.
//

import UIKit

class EventController: NSObject {
    var listenerKeyHolder = [String: String]()

    @objc func addEvent(_ eventName: String, _ eventListener: @escaping ([AnyHashable: Any]?) -> Void) {
        addEvent(eventName, true, eventListener)
    }

    @objc func addEvent(_ eventName: String, _ isHoldIn: Bool, _ eventListener: @escaping ([AnyHashable: Any]?) -> Void) {
        let listenerKey = EventBox.globalEventBox._addEvent(eventName, isHoldIn, eventListener)
        if listenerKeyHolder[eventName] != nil {
            assert(false, "对同一个事件多次添加回调")
            return
        }
        listenerKeyHolder[eventName] = listenerKey
    }

    class func trigggerEvent(_ eventName: String) {
        trigggerEvent(eventName, parameters: nil)
    }

    class func trigggerEvent(_ eventName: String, parameters: [AnyHashable: Any]?) {
        EventBox.globalEventBox._trigggerEvent(eventName, parameters)
    }

    private func removeEventListener() {
        for (eventName, listenerKey) in listenerKeyHolder {
            EventBox.globalEventBox._removeEventListener(eventName, listenerKey)
        }
    }

    deinit {
        removeEventListener()
    }
}
