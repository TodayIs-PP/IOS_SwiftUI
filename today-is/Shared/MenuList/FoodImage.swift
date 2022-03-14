//
//  FoodImage.swift
//  today-is
//
//  Created by 이주열 on 2022/03/11.
//

import SwiftUI

struct FoodImage: View {
    var body: some View {
        Image("TodayIs_icon")
            .resizable()
            .frame(width: 190, height: 200)
            .clipShape(Rectangle())
            .overlay {
                Rectangle().stroke(.black, lineWidth: 2)
            }
    }
}

struct FoodImage_Previews: PreviewProvider {
    static var previews: some View {
        FoodImage()
    }
}
