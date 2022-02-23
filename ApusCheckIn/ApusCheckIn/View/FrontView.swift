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
                Text("My distance from Cluster: \(Int(locationManager.myDistanceFromCluster)) meter")
                    .font(.title2).fontWeight(.ultraLight)
                    .padding(.bottom, 30)
                    .multilineTextAlignment(.center)
            }
            .navigationBarHidden(true)
        }
    }
}

struct EntranceButton: View {
    @State private var showModal = false
    var uuidManager: UUIDManager
    var isInLocation: Bool
    var time: String = ""
    var body: some View {
        NavigationLink (
            //            showModal = true
            destination: MyView(intraID: uuidManager.intraID)
                .simultaneousGesture(TapGesture().onEnded{
                    if uuidManager.isFirst == true {
                        //show Popup and get intraID, register to db
                        uuidManager.isFirst = false
                    }
                }),
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
        //        .sheet(isPresented: self.$showModal) {
        //            MyView(intraID: intraID)
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
