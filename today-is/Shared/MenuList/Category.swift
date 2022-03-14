//
//  Category.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct Category: View {
    var body: some View {
        HStack {
            Text("한식")
            Text("중식")
            Text("양식")
            Text("일식")
            Text("분식")
            Text("디저트")
            Text("치킨")
            Text("피자")
            Text("패스트푸드")
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category()
    }
}
