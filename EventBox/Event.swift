//
//  Event.swift
//  EventController
//
//  Created by jet on 2019/3/19.
//  Copyright © 2019年 jet. All rights reserved.
//

import UIKit

class Event: NSObject {
    var listenerHolder = [String: ([AnyHashable: Any]?) -> Void]()

    var listenerStatusHolder = [String: String]()

    var holdIn: Bool = false

    func _addListener(_ holdIn: Bool, _ eventListener: @escaping ([AnyHashable: Any]?) -> Void) -> String! {
        let listenerKey = UUID().uuidString
        listenerHolder[listenerKey] = eventListener
        listenerStatusHolder[listenerKey] = holdIn ? "1" : "0"
        return listenerKey
    }

    func _trigger(_ parameters: [AnyHashable: Any]?) {
        var removeKeyArray = [String]()
        for (key, eventListener) in listenerHolder {
            eventListener(parameters)
            let hold = listenerStatusHolder[key]
            if "0" == hold {
                removeKeyArray.append(key)
            }
        }
        for key in removeKeyArray {
            listenerStatusHolder.removeValue(forKey: key)
            listenerHolder.removeValue(forKey: key)
        }
    }

    func _removeListerer(_ listenerKey: String!) {
        listenerStatusHolder.removeValue(forKey: listenerKey)
        listenerHolder.removeValue(forKey: listenerKey)
    }

    func _removeAllListener() {
        listenerStatusHolder.removeAll()
        listenerHolder.removeAll()
    }
}
