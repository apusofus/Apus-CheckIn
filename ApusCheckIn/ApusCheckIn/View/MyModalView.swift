//
//  MyModalView.swift
//  MyModal
//
//  Created by Suji Lee on 2022/02/23.
//

import SwiftUI

struct MyModalView: View {
    
    //뷰모델의 클래스를 @ObservedObject 변수명 viewModel로 선언한다.
    @ObservedObject var viewModel: MyModalViewModel
    

    var body: some View {
        NavigationView {
                VStack {
                    List {
                        Section {
                            //여기서 ForEach를 쓰려면 Model ->idenfiable
                            //VieMode -> private(set)으로 해야함
                            ForEach(viewModel.members) { member in
                                if member.didMemberCheckInToday() {
                                    HStack() {
                                        Text("\(member.name)")
                                        Spacer()
                                        Text("time")
                                            .font(.caption)
                                            .foregroundColor(Color.gray)
                                        //이미지를 뷰로 따로 빼기. 템플릿화
                                        if member.didMemberCheckInThur() {
                                            Image(systemName: "swift")
                                                .foregroundColor(.blue)
                                        } else {
                                            Image(systemName: "applelogo")
                                                .foregroundColor(.blue)
                                                
                                                
                                        }


                                    }
                                }
 
                            }
                        } header: {
                            Text("APUS On")
                                .foregroundColor(.blue)

                        }
                        
                        
                        Section {
                            ForEach(viewModel.members) { member in
                                if member.didMemberCheckInToday() == false {
                                    HStack() {
                                        Text("\(member.name)")
                                            .foregroundColor(.gray)
                                     }
                                }
 
                            }
                        } header: {
                            Text("APUS Off")
                                .foregroundColor(.gray)
                        }
                    }
                    .listStyle(SidebarListStyle())

                }
                .navigationBarTitle(Member.changeDateToString())
        }

    }
}



                           

struct MyModalView_Previews: PreviewProvider {
    static var previews: some View {
        MyModalView(viewModel: MyModalViewModel())
    }
}
