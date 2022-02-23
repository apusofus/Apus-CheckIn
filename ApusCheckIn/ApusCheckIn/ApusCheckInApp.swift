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
        checkin = LocationManager()
        uuidManager = UUIDManager(uuid: UIDevice.current.identifierForVendor!.uuidString)
    }

    let checkin: LocationManager
    let uuidManager: UUIDManager
    var body: some Scene {
        WindowGroup {
            FrontView(
                locationManager: checkin,
                uuidManager: uuidManager
            )
        }
    }
}
