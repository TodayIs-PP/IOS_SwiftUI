//
//  SearchView.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            VStack {
                
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
