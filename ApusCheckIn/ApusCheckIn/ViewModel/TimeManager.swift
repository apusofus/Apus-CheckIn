//
//  TimeManager.swift
//  ApusCheckIn
//
//  Created by Young Soo Hwang on 2022/02/22.
//

import Foundation

class TimeManager {
    var time: String
    init() {
        self.time = ProcessTime.getTime()
    }
}
