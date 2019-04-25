//
//  EventBox.swift
//  EventController
//
//  Created by jet on 2019/3/19.
//  Copyright © 2019年 jet. All rights reserved.
//

import UIKit

class EventBox: NSObject {
    static let globalEventBox = EventBox()
    var eventHolder = [String: Event]()
    private override init() {

    }

    func _addEvent(eventName: String, eventListener: @escaping ([AnyHashable: Any]?) -> Void) -> String {
        return _addEvent(eventName, false, eventListener)
    }

    func _addEvent(_ eventName: String, _ isHoldIn: Bool, _ eventListener: @escaping ([AnyHashable: Any]?) -> Void) -> String {
        var event: Event? = eventHolder[eventName]
        if event == nil {
            event = Event()
            eventHolder[eventName] = event
        }
        let listenerKey: String = event!._addListener(isHoldIn, eventListener)
        return listenerKey
    }

    func _removeEventListener(_ eventName: String, _ listenerKey: String) {
        if let event = eventHolder[eventName] {
            event._removeListerer(listenerKey)
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
            event._removeAllListener()
            eventHolder.removeValue(forKey: eventName)
        }
    }

    func _trigggerEvent(eventName: String) {
        _trigggerEvent(eventName, nil)
    }

    func _trigggerEvent(_ eventName: String, _ parameters: [AnyHashable: Any]?) {
        if let event = eventHolder[eventName] {
            event._trigger(parameters)
        }
    }

}
