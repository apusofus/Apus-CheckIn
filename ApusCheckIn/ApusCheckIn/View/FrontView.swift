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
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Apus Check-In")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                Spacer()
                EntranceButton(uuidManager: uuidManager, isInLocation: locationManager.isNear).padding(.bottom)
                Spacer()
                Text("IntraID: \(uuidManager.intraID)")
                    .font(.title2).fontWeight(.ultraLight)
                Text(locationManager.myDistanceFromCluster)
                    .font(.title2).fontWeight(.ultraLight)
                    .padding(.bottom, 30)
                    .multilineTextAlignment(.center)
                
            }
            .navigationBarHidden(true)
            .alert(isPresented: $uuidManager.isFirst,
                   TextAlert(title: "Give me your IntraID",
                             message: "",
                             keyboardType: .alphabet) { result in
                if let intraID = result {
                    Firestore.firestore().collection("testCollection").document(uuidManager.UUID).setData(["intraID" : "*\(intraID)*"], merge: true)
                    uuidManager.isFirst = false
                    uuidManager.renewIntraId(intraID: intraID)
                }
            })
        }
    }
}

struct EntranceButton: View {
    @State private var showModal = false
    @ObservedObject var uuidManager: UUIDManager
    var isInLocation: Bool
    var time: String = ""
    var body: some View {
        NavigationLink (
            destination: MyView(intraID: uuidManager.intraID),
            label: {
                if isInLocation == true {
                    Image("coloredApus").resizable()
                } else {
                    Image("uncoloredApus").resizable()
                }
            })
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
