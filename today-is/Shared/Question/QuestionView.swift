//
//  QuestionView.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct QuestionView: View {
    @StateObject private var api = RequestAPI.shard
    @State var searchText = ""
    @State var category: String = "전체"
    @State var foods: [Food] = []
    
    var body: some View {
        VStack {
            QuestionBox()
                .padding(.vertical)
            SearchBar(text: $searchText, foods: $foods)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                .padding(.vertical)
            ResultList(foods: api.searchFoods)
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
