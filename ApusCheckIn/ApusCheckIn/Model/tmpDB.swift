//
//  tmpDB.swift
//  ApusCheckIn
//
//  Created by Young Soo Hwang on 2022/02/18.
//

import Foundation
import Firebase

struct tmpDB {
        let db: Dictionary<String, String> = [
        "8880CD65-302C-4C57-AA26-421AEFC9456C": "yohwang",
        "7F68753B-E9B9-47A4-A23E-31E503DAAB0F": "simulator",
        "9D417A9B-44FC-4A66-B85B-B28C8D6EC4CC": "hakim's simulator",
        "92567420-C6B4-4845-95D5-9C8A6E7EA00A": "hakim"
    ]
    // static을 뗀 이유는 추후에 fireStore가 추가되면,
    // UUIDManager의 fireStore 인스턴스를 만들어서 사용할 것이기 때문
    func getIntraByUUID(uuid: String) -> String {
        // 나중에 DB를 fireStore로 변경
        if let intraId = self.db[uuid] {
            return intraId
        } else {
            return "undefined"
        }
    }
}


