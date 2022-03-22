//
//  QuestionView.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct QuestionView: View {
    @StateObject private var api = RequestAPI.shard
    @State var category: String = "전체"
    
    var body: some View {
        VStack {
            QuestionBox()
                .padding(.vertical)
            SearchView()
            ResultList(foods: api.foodsByCategory)
        }
        .onAppear{
            api.getFoodsByCategory()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
