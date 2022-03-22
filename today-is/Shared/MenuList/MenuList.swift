//
//  MenuList.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct MenuList: View {
    var categories: [String] = []
    var foods: [Food] = []
    
    var body: some View {
        Category(categories: categories)
        SquareFoodList(foods: foods)
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
