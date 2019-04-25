//
//  JETEventBox.swift
//  JETEventController
//
//  Created by gaodun on 2019/3/19.
//  Copyright © 2019年 gaodun. All rights reserved.
//

import UIKit

class JETEventBox: NSObject {
    static let globalEventBox = JETEventBox()
    var eventHolder = [String: JETEvent]()
    private override init() {

    }

    func _addEvent(eventName: String, eventListener: @escaping ([String: Any]?) -> Void) -> String {
        return _addEvent(eventName, false, eventListener)
    }

    func _addEvent(_ eventName: String, _ isHoldIn: Bool, _ eventListener: @escaping ([String: Any]?) -> Void) -> String {
        var event: JETEvent? = eventHolder[eventName]
        if event == nil {
            event = JETEvent()
            eventHolder[eventName] = event
        }
        let listenerKey: String = event!.addListener(holdIn: isHoldIn, eventListener: eventListener)
        return listenerKey
    }

    func _removeEventListener(_ eventName: String, _ listenerKey: String) {
        if let event = eventHolder[eventName] {
            event.removeListerer(listenerKey)
        }
    }

    func _removeAllevent() {
        for (eventName, _) in eventHolder {
            _removeEventAllListener(eventName)
        }
        eventHolder.removeAll()
    }

    func _removeEventAllListener(_ eventName: String) {
        if let event = eventHolder[eventName] {
            event.removeAllListener()
            eventHolder.removeValue(forKey: eventName)
        }
    }

    func _trigggerEvent(eventName: String) {
        _trigggerEvent(eventName, nil)
    }

    func _trigggerEvent(_ eventName: String, _ parameters: [String: Any]?) {
        if let event = eventHolder[eventName] {
            event.trigger(parameters: parameters)
        }
    }

}
