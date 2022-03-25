//
//  Category.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct Category: View {
    var categories: [String]
    @Binding var foods: [Food]
    
    @StateObject private var api = RequestAPI.shard
    @State var chosedCategory: String = "전체"
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        self.chosedCategory = category
                        api.getFoodsByCategory(category: category)
                        foods = api.foodsByCategory
                        print("button pushed")
                        print(category)
                        print(foods)
                    }) {
                        if chosedCategory == category {
                            Text(category)
                                .padding(.all, 3)
                                .padding(.horizontal, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color(red: 188 / 255, green: 246 / 255, blue: 179 / 255))
                                )
                                .font(Font.body.bold())
                        }
                        else {
                            Text(category)
                                .padding(.all, 3)
                                .padding(.horizontal, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color(red: 188 / 255, green: 246 / 255, blue: 179 / 255))
                                )
                        }
                    }
                }
            }
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category(categories: ["전체", "한식", "중식", "양식", "일식", "디저트", "분식", "치킨", "피자", "패스트푸드"], foods: .constant([Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "eeee", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "eeee", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "adf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "WKddas", name: "ㅁㅇㄹ", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", flavor1: "cxv", flavor2: "erh", __v: 0)]))
    }
}
