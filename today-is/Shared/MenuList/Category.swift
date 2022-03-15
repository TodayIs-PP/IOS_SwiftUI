//
//  Category.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct Category: View {
    
    var categories: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category(categories: ["전체", "한식", "중식", "양식", "일식", "디저트", "분식", "치킨", "피자", "패스트푸드"])
    }
}
