//
//  ContentView.swift
//  Shared
//
//  Created by 이주열 on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var api = RequestAPI.shard
    @State var isHome: Bool = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    AppBar(isHome: $isHome)
                    isHome ? AnyView(MenuList(categories: api.categories)) : AnyView(QuestionView())
                }.onAppear {
                    api.getFoodsByCategory(category: "전체")
//                    api.getFoods()
                    api.getCategory()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
