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
        let  chunkedFoods = foods.chunked(into: 2)
        
        ScrollView {
            VStack {
                let _ = print("out of foreach")
                ForEach(0..<chunkedFoods.count, id:\.self) { index in
                    HStack(alignment: .center) {
                        let _ = print(chunkedFoods)
                        ForEach(chunkedFoods[index], id: \._id) { food in
                            SquareFood(food: food)
                        }
                    }
                }
            }
        }
    }
}

struct SquareFoodList_Previews: PreviewProvider {
    static var previews: some View {
        SquareFoodList(foods: [Food(_id: "adfdw", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adfdw", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "eeee", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0)])
    }
}
