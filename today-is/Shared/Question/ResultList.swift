//
//  ResultList.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct ResultList: View {
    @StateObject private var api = RequestAPI.shard
    @Binding var questionNum: Int
    @Binding var chosedFoods: [String]
    var foods: [Food]
    
    func addQuestionNum() {
        if chosedFoods.count == 2 {
            questionNum += 1
            api.getCategory()
        }
    }
    
    var body: some View {
        VStack {
            Button(action: {
                chosedFoods.append("nil")
                addQuestionNum()
            }) {
                Text("건너뛰기")
            }
            
            ScrollView {
                VStack {
                    ForEach(foods, id: \._id) { food in
                        Button(action: {
                            chosedFoods.append(food.detailKind)
                            addQuestionNum()
                        }) {
                            ResultDetail(food: food)
                                .padding(.leading, 20)
                        }
                    }
                }
            }
        }
    }
}

struct ResultList_Previews: PreviewProvider {
    static var previews: some View {
        ResultList(questionNum: .constant(0), chosedFoods: .constant([]), foods: [Food(_id: "adf", name: "asdf", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "qwer", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0),Food(_id: "adf", name: "zxcv", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "qaz", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "wsx", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0), Food(_id: "adf", name: "edc", image: "1647220132863.jpeg", kind1: "we", kind2: "svd", detailKind: "adf", flavor1: "cxv", flavor2: "erh", __v: 0),])
    }
}
