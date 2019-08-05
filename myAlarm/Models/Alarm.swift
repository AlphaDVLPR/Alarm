//
//  Alarm.swift
//  myAlarm
//
//  Created by AlphaDVLPR on 8/5/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

class Alarm : Codable {
    
    var fireDate: Date
    var name: String
    var enabled: Bool
//    var uuid: String
//    var firstTimeAsString: String {
//        get {
//            return fireDate.description
//        }
    
    
    init(fireDate: Date, name: String, enabled: Bool = false) {
        
        self.fireDate = fireDate
        self.name = name
        self.enabled = enabled
    }
}

extension Alarm : Equatable {
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        return
        lhs.fireDate == rhs.fireDate && lhs.name == rhs.name && lhs.enabled == rhs.enabled
    }
}
