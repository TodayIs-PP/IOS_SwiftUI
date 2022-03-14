//
//  SquareFoodList.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct SquareFoodList: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    SquareFood()
                    SquareFood()
                }
                HStack {
                    SquareFood()
                    SquareFood()
                }
                HStack {
                    SquareFood()
                    SquareFood()
                }
                HStack {
                    SquareFood()
                    SquareFood()
                }
            }
        }
    }
}

struct SquareFoodList_Previews: PreviewProvider {
    static var previews: some View {
        SquareFoodList()
    }
}
