//
//  SquareFood.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct SquareFood: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            FoodImage()
            FoodInfo()
        }
    }
}

struct SquareFood_Previews: PreviewProvider {
    static var previews: some View {
        SquareFood()
    }
}
