//
//  FoodInfo.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct FoodInfo: View {
    var body: some View {
        ZStack {
            Color.white.frame(width: 190, height: 100, alignment: Alignment.center).opacity(0.7)
            VStack {
                Text("뿌링클").font(.title).padding(.bottom)
                Text("치킨/짠맛/단맛")
            }
            
        }
    }
}

struct FoodInfo_Previews: PreviewProvider {
    static var previews: some View {
        FoodInfo()
    }
}
