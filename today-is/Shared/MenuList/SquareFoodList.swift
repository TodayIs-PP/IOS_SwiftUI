//
//  SquareFoodList.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct SquareFoodList: View {
    var foods: [Food]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(foods, id: \.self) { food in
                    SquareFood(food: food)
                }
//                HStack {
//                    SquareFood()
//                    SquareFood()
//                }
//                HStack {
//                    SquareFood()
//                    SquareFood()
//                }
//                HStack {
//                    SquareFood()
//                    SquareFood()
//                }
//                HStack {
//                    SquareFood()
//                    SquareFood()
//                }
            }
        }
    }
}

struct SquareFoodList_Previews: PreviewProvider {
    static var previews: some View {
        SquareFoodList(foods: [Food(_id: "adf", name: "adf", image: "adf", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "이미지", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "adf", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "이미지", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "adf", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "이미지", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0)])
    }
}
