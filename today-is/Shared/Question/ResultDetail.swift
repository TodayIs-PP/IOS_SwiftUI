//
//  ResultDetail.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct ResultDetail: View {
    var food: Food
    
    var body: some View {
        HStack {
            ResultDetailImage(imageName: food.image)
            ResultDetailInfo(name: food.name, kind1: food.kind1, kind2: food.kind2, flavor1: food.flavor1, flavor2: food.flavor2)
        }
    }
}

struct ResultDetail_Previews: PreviewProvider {
    static var previews: some View {
        ResultDetail(food: Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0))
    }
}
