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
            SearchView(searchText: $searchText, foods: $foods)
                .padding(.vertical)
            Text("input: \(searchText)")
            ResultList(foods: foods)
        }
        .onAppear{
            api.getFoodsByCategory(category: category)
            foods = api.foodsByCategory
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
