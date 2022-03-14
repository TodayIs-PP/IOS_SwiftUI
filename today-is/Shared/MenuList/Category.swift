//
//  Category.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct Category: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("치킨").font(.title)
            ScrollView(.horizontal) {
                HStack {
                    SquareFood()
                    SquareFood()
                    SquareFood()
                }
            }
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category()
    }
}
