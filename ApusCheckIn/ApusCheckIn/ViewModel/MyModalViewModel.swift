//
//  MyModalViewModel.swift
//  MyModal
//
//  Created by Suji Lee on 2022/02/23.
//

import Foundation
import SwiftUI

//파일명과 동일한 이름의 class를 생성한다. 타입은 ObservalbleObject로 해야지.
//내가 모니터링 할 데이터 덩어리는 모델의 Member니까 그걸 members라는 새로운 @Published 배열 변수로 선언해 할당한다.
//init() {} 안에서 members.append 함수로 멤버에 요소를 추가해준다

class MyModalViewModel: ObservableObject {
    @Published private(set) var members: [Member] = []
    
    init() {
        members.append(Member(name: "sujilee", attendedDates: [Date()]))
        members.append(Member(name: "jaehwkim", attendedDates: [Date()]))
        members.append(Member(name: "jujeon", attendedDates: [Date()]))
        members.append(Member(name: "hakim", attendedDates: []))
        members.append(Member(name: "yohwang", attendedDates: []))

    }
}
