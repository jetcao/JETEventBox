//
//  JETEvent.swift
//  JETEventController
//
//  Created by gaodun on 2019/3/19.
//  Copyright © 2019年 gaodun. All rights reserved.
//

import UIKit

class JETEvent: NSObject {
    var listenerHolder = [String: ([String: Any]?) -> Void]()

    var listenerStatusHolder = [String: String]()

    var holdIn: Bool = false

    func addListener(holdIn: Bool, eventListener: @escaping ([String: Any]?) -> Void) -> String! {
        let listenerKey = UUID().uuidString
        listenerHolder[listenerKey] = eventListener
        listenerStatusHolder[listenerKey] = holdIn ? "1" : "0"
        return listenerKey
    }

    func trigger(parameters: [String: Any]?) {
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

    func removeListerer(_ listenerKey: String!) {
        listenerStatusHolder.removeValue(forKey: listenerKey)
        listenerHolder.removeValue(forKey: listenerKey)
    }

    func removeAllListener() {
        listenerStatusHolder.removeAll()
        listenerHolder.removeAll()
    }
}
