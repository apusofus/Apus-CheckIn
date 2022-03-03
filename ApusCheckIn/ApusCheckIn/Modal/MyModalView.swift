////
////  MyModalView.swift
////  CalendarTest
////
////  Created by 김나연 on 2022/03/01.
////
//
//import SwiftUI
//
//struct MyModalView: View {
//    var date: Date = Date()
//    let formatter = DateFormatter()
//
//    static let dateformat: DateFormatter = {
//          let formatter = DateFormatter()
//           formatter.dateFormat = "YYYY년 M월 d일"
//           return formatter
//       }()
//
//    var body: some View {
//            Text("오늘의 날짜입니다 : \(date, formatter: MyModalView.dateformat)")
//    }
//}
//
//struct MyModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyModalView()
//    }
//}
