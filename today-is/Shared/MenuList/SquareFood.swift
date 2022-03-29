//
//  SquareFood.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct SquareFood: View {
    var food: Food
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            FoodImage(imageName: food.image)
            FoodInfo(name: food.name, kind1: food.kind1, kind2: food.kind2, flavor1: food.flavor1, flavor2: food.flavor2)
        }
    }
}

struct SquareFood_Previews: PreviewProvider {
    static var previews: some View {
        SquareFood(food: Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0))
    }
}
