//
//  MenuList.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct MenuList: View {
    @ObservedObject private var api = RequestAPI.shard
    var categories: [String]
    
    var body: some View {
        VStack {
            Category(categories: categories)
            SquareFoodList(foods: api.foodsByCategory)
        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(categories: [
            "전체",
            "한식",
            "중식",
            "양식",
            "일식",
            "분식",
            "디저트",
            "치킨",
            "피자",
            "패스트푸드",
        ])
    }
}
