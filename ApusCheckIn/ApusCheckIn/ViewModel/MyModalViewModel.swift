//
//  MyModalViewModel.swift
//  MyModal
//
//  Created by Suji Lee on 2022/02/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import CodableFirebase

//파일명과 동일한 이름의 class를 생성한다. 타입은 ObservalbleObject로 해야지.
//내가 모니터링 할 데이터 덩어리는 모델의 Member니까 그걸 members라는 새로운 @Published 배열 변수로 선언해 할당한다.
//init() {} 안에서 members.append 함수로 멤버에 요소를 추가해준다

class MyModalViewModel: ObservableObject {
    @Published private(set) var members: [Member] = []
    private var db = Firestore.firestore()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let docRef = db.collection("testCollection")
        docRef.getDocuments() { (querySnapshot, err) in
            if err != nil {
//                print("error: \(err)")
            } else {
                guard let documents = querySnapshot?.documents else { return }
                for doc in documents {
                    let data = doc.data()
                    let id = doc.documentID
                    let intraID = data["intraID"] as? String ?? "NONE"
                    var dateArr = Array<Date>()
                    if let dateDictionary = data["Dates"] {
                        let dict = dateDictionary as! Dictionary<String, Timestamp>
                        for (_, value) in dict {
                            let dateValue = value.dateValue()
                            dateArr.append(dateValue)
                        }
                    }
                    let member = Member(id: id, intraID: intraID, dates: dateArr)
                    self.members.append(member)
                }
//                print(self.members)
            }
        }
    }
}


//let docRef = db.collection("testCollection")
//docRef.getDocuments() { (querySnapshot, err) in
//    if let err = err {
//        print("error : \(err)")
//    } else {
//        guard let documents = querySnapshot?.documents else { return }
//        for doc in documents {
////                    let data = doc.data() as Dictionary<String, Any>
////                    let name:String = data["intraID"] as! String
////                    print(data[""]!)
//        }
//    }
//}
