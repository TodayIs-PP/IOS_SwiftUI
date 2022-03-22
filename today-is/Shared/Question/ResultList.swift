//
//  ResultList.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct ResultList: View {
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

struct ResultList_Previews: PreviewProvider {
    static var previews: some View {
        ResultList(foods: [Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "eeee", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "eeee", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0)])
    }
}
