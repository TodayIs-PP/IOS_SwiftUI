//
//  CategoryList.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct CategoryList: View {
    var body: some View {
        VStack{
            Category()
            Category()
            Category()
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
