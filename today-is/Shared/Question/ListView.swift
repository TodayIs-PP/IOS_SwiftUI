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
    @State var flag: Bool = false
    var items: [String]
    
    func addQuestionNum(){
        if chosedResponse.count == 4 {
            questionNum += 1
            api.getTastes()
        } else if chosedResponse.count == 6 {
            print("count of chosedResponse is 6")
            api.getResult(answers: chosedResponse)
            flag = true
        }
    }
    
    var body: some View {
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
            if flag {
                NavigationLink(
                    destination: QuestionResultList(foods: api.result).onAppear{
                        print("결과보기")
                        api.getResult(answers: chosedResponse)
                    },
                    label: { Text("결과보기").font(.title).padding(.top, 30) }
                )
            }
        }.padding(.top, 30)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(questionNum: .constant(2), chosedResponse: .constant(["라면", "치킨"]), items: ["전체", "한식", "중식", "양식", "일식", "분식", "디저트", "치킨", "피자", "패스트푸드", "인스턴트"])
    }
}
