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
    @ObservedObject var uuidManager: UUIDManager
    var isInLocation: Bool
    var time: String = ""
    var body: some View {
        NavigationLink (
            destination: CalenderView(),
            //MyView(intraID: uuidManager.intraID),
            label: {
                if isInLocation == true {
                    ZStack {
                        RoundedRectangle(cornerRadius:50).foregroundColor(.cyan)
                        Image(systemName: "swift").foregroundColor(.black).font(.system(size: self.buttonWidth()/2))
                    }
                } else {
                    ZStack{
                        RoundedRectangle(cornerRadius:50).foregroundColor(.gray)
                        Image(systemName: "swift").foregroundColor(.black).font(.system(size: self.buttonWidth()/2))
                    }
                }
            })
            .simultaneousGesture(TapGesture().onEnded{
                Firestore.firestore().collection("testCollection").document(uuidManager.UUID).setData(["Date" : Date()], merge: true)
//                print(Date())
//                Firestore.firestore().collection("testCollection").document(uuidManager.UUID).getDocument { (document, error) in
//                    if let document = document, document.exists {
//                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                        let tmp = dataDescription
//                        print(tmp)
//                    }
//                }
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
