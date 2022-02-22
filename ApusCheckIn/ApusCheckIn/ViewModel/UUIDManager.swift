//
//  UUIDManager.swift
//  ApusCheckIn
//
//  Created by Young Soo Hwang on 2022/02/18.
//

import Foundation

class UUIDManager: ObservableObject {
    var UUID: String
    var intraID: String
    let db = tmpDB()
    init(uuid: String) {
        self.UUID = uuid
        print(uuid) // 추후 삭제할 것
        self.intraID = db.getIntraByUUID(uuid: uuid)
    }
}

