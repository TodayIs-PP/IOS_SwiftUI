//
//  QuestionView.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct QuestionView: View {
    @StateObject private var api = RequestAPI.shard
    @State private var searchText = ""
    @State private var category: String = "전체"
    @State private var questionNum: Int = 0
    @State private var chosedResponse: [String] = []
    
    var body: some View {
        VStack {
            QuestionBox(questionNum: $questionNum)
                .padding(.vertical)
            HStack {
                ForEach(0 ..< 6) {i in
                    if i < chosedResponse.count {
                        Circle()
                            .fill(Color(red: 188 / 255, green: 246 / 255, blue: 179 / 255))
                            .frame(width: 20.0, height: 20)
                    }
                    else {
                        Circle()
                            .stroke(Color(red: 188 / 255, green: 246 / 255, blue: 179 / 255))
                            .frame(width: 20.0, height: 20)
                    }
                }
            }
            if questionNum == 0 {
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .padding(.vertical)
                ResultList(questionNum: $questionNum, chosedFoods: $chosedResponse, foods: api.searchFoods)
            } else if questionNum == 1 {
                ListView(questionNum: $questionNum, chosedResponse: $chosedResponse, items: api.categories)
            } else if questionNum == 2 {
                let _ = print(questionNum)
                ListView(questionNum: $questionNum, chosedResponse: $chosedResponse, items: api.tastes)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
