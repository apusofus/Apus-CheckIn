//
//  ProcessTime.swift
//  ApusCheckIn
//
//  Created by Young Soo Hwang on 2022/02/22.
//

import Foundation

struct ProcessTime {
    static func getTime() -> String {
        let date: Date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm:ss"
        return (formatter.string(from: date))
    }
}
