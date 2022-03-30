//
//  QuestionResultList.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/29.
//

import SwiftUI

struct QuestionResultList: View {
    var foods: [Food]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(foods, id: \._id) { food in
                    ResultDetail(food: food)
                        .padding(.leading, 20)
                }
            }
        }
    }
}

struct QuestionResultList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionResultList(foods: [Food(_id: "adf", name: "asdf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "qwer", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "zxcv", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "qaz", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "wsx", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "edc", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0),])
    }
}
