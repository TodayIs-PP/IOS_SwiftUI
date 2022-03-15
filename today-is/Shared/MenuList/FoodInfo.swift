//
//  FoodInfo.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct FoodInfo: View {
    var name: String
    var kind1: String
    var kind2: String? = ""
    var flavor1: String
    var flavor2: String? = ""
    
    func getInfo() -> String {
        var info = "" + kind1 + "/"
        
        if let notEmptyFlavor2 = flavor2 {
            if let notEmptyKind2 = kind2 {
                info += notEmptyKind2 + "/"
            }
            info += flavor1 + "/"
            info += notEmptyFlavor2
        }
        else {
            if let notEmptyKind2 = kind2 {
                info += notEmptyKind2 + "/"
            }
            info += flavor1
        }
        
        
        
        
//        if let notEmptyFlavor2 = flavor2 {
//            info += notEmptyFlavor2
//        }
        return info
    }
    
    var body: some View {
        ZStack {
            Color.white.frame(width: 190, height: 100, alignment: Alignment.center).opacity(0.7)
            VStack {
                Text(name).font(.title).padding(.bottom)
                Text(getInfo())
            }
        }
    }
}

struct FoodInfo_Previews: PreviewProvider {
    static var previews: some View {
        FoodInfo(name: "자장면", kind1: "중식", kind2: nil, flavor1: "짠맛", flavor2: nil)
    }
}
