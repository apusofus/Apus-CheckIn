//
//  FrontView.swift
//  ApusCheckIn
//
//  Created by Han Gyul Kim on 2022/02/17.
//

import SwiftUI
import Firebase

struct FrontView: View {
    @ObservedObject var locationManager: LocationManager
    @ObservedObject var uuidManager: UUIDManager
//     DB의 idfv와 기기의 idfv를 비교해 받아올 예정
    // Test
    var body: some View {
        VStack {
            Spacer()
            Text("Apus Check-In")
                .font(.largeTitle)
                .fontWeight(.thin)
            Spacer()
            EntranceButton(isInLocation: locationManager.isNear, intraID: uuidManager.intraID).padding(.bottom)
            Spacer()
            Text("IntraID: \(uuidManager.intraID)")
                .font(.title2).fontWeight(.ultraLight)
            Text("My distance from Cluster: \(Int(locationManager.myDistanceFromCluster)) meter")
                .font(.title2).fontWeight(.ultraLight)
                .padding(.bottom, 30)
                .multilineTextAlignment(.center)
        }
    }
}

struct EntranceButton: View {
    @State private var showModal = false
    var isInLocation: Bool
    var intraID: String
    var time: String = ""
    var body: some View {
        Button {
            showModal = true
        } label: {
            if isInLocation == true {
                Image("coloredApus").resizable()
            } else {
                Image("uncoloredApus").resizable()
            }
        }
        .sheet(isPresented: self.$showModal) {
            MyView(intraID: intraID)
        }
        .frame(width: self.buttonWidth(),
               height: self.buttonHeight())
        .disabled(!isInLocation)
    }
    
    private func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 1.2
    }
    
    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 1.2
    }
}

struct FrontView_Previews: PreviewProvider {
    static var previews: some View {
        let checkin = LocationManager()
        let uuidManager = UUIDManager(uuid: UIDevice.current.identifierForVendor!.uuidString)
        FrontView(
            locationManager: checkin,
            uuidManager: uuidManager
        )
        
    }
}
