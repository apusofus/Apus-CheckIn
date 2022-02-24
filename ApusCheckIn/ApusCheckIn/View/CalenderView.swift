//
//  ContentView.swift
//  CalendarTest
//
//  Created by 김나연 on 2022/02/23.
//

import SwiftUI

struct CalenderView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView().preferredColorScheme(.dark)
        CalenderView().preferredColorScheme(.light)

    }
}
