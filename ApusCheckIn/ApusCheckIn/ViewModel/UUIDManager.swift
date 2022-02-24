//
//  UUIDManager.swift
//  ApusCheckIn
//
//  Created by Young Soo Hwang on 2022/02/18.
//

import Foundation
import Firebase

class UUIDManager: ObservableObject {
    @Published var isFirst = false
    @Published var intraID: String
    var UUID: String
    
    let db = Firestore.firestore()
    init(uuid: String) {
        self.UUID = uuid
        print(uuid) // 추후 삭제할 것
        self.intraID = "undefined"
        db.collection("testCollection").document(uuid).getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                let tmp = dataDescription.split(separator: "*")
                self.intraID = String(tmp[1])
                print(self.intraID)
            } else {
                self.isFirst = true
            }
        }
    }
    
    func renewIntraId(intraID: String) {
        self.intraID = intraID
    }
}

