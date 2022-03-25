//
//  SearchBar.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct SearchBar: View {
//    @EnvironmentObject var foods: ShareFoods
    @StateObject private var api = RequestAPI.shard
    @Binding var text: String
    @Binding var foods: [Food]
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
 
                TextField("Search", text: $text, onCommit: {
                    api.getSearchResult(searchText: text)
                    foods = api.foodsByCategory
                    print("in textfield")
                    print(foods)
                })
                    .foregroundColor(.primary)
 
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static let foods = ShareFoods()
    
    static var previews: some View {
        SearchBar(text: .constant(""), foods: .constant([Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "eeee", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "eeee", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0)]))
            .environmentObject(foods)
    }
}
