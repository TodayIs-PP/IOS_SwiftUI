//
//  ResultDetailInfo.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct ResultDetailInfo: View {
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
        return info
    }
    
    var body: some View {
        HStack {
            Text(name).font(.title)
            Spacer()
            Text(getInfo())
            Spacer()
        }
    }
}

struct ResultDetailInfo_Previews: PreviewProvider {
    static var previews: some View {
        ResultDetailInfo(name: "자장면", kind1: "중식", kind2: "안녕한", flavor1: "짠맛", flavor2: "맛있네")
    }
}
