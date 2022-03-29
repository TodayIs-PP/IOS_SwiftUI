//
//  ListView.swift
//  today-is
//
//  Created by 이주열 on 2022/03/29.
//

import SwiftUI

struct ListView: View {
    @StateObject private var api = RequestAPI.shard
    @Binding var questionNum: Int
    @Binding var chosedResponse: [String]
    var items: [String]
    
    func addQuestionNum(){
        if chosedResponse.count == 4 {
            questionNum += 1
            api.getTastes()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(items, id: \.self){ item in
                    Button(action: {
                        chosedResponse.append(item)
                        addQuestionNum()
                    }) {
                        Spacer()
                        Text(item)
                            .frame(width: 350, height: 50)
                            .clipShape(Rectangle())
                            .overlay {
                                RoundedRectangle(cornerRadius: 25).stroke(.black, lineWidth: 1)
                            }
                        Spacer()
                    }
                }
                NavigationLink(
                    destination: QuestionResultList(),
                    label: { Text("결과보기") }
                )
            }.padding(.top, 30)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(questionNum: .constant(2), chosedResponse: .constant(["라면", "치킨"]), items: ["전체", "한식", "중식", "양식", "일식", "분식", "디저트", "치킨", "피자", "패스트푸드", "인스턴트"])
    }
}
