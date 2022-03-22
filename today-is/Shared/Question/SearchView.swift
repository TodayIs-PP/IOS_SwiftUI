//
//  SearchView.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @Binding var foods: [Food]
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText, foods: $foods)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""), foods: .constant([Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "eeee", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "eeee", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0)]))
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
