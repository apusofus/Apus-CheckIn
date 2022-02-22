//
//  ApusCheckInApp.swift
//  ApusCheckIn
//
//  Created by Han Gyul Kim on 2022/02/17.
//

import SwiftUI
import Firebase

@main
struct ApusCheckInApp: App {
    init() {
        FirebaseApp.configure()
        db()
    }
    func db(){
        Firestore.firestore().collection("testCollection").document("92567420-C6B4-4845-95D5-9C8A6E7EA00A").setData(["intraID" : "hakim"])
    }
    let checkin = LocationManager()
    let uuidManager = UUIDManager(uuid: UIDevice.current.identifierForVendor!.uuidString)
    var body: some Scene {
        WindowGroup {
            FrontView(
                locationManager: checkin,
                uuidManager: uuidManager
            )
        }
    }
}
