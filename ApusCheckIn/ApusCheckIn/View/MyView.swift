//
//  MyView.swift
//  ApusCheckIn
//
//  Created by Young Soo Hwang on 2022/02/22.
//

import SwiftUI

struct MyView: View {
    var intraID: String
    var body: some View {
        VStack {
            Text(Date(), style: .time)
            Text(intraID)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(intraID: "test")
    }
}

