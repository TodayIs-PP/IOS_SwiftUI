//
//  Foods.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/24.
//

import Foundation

final class ShareFoods: ObservableObject {
    @Published var foods: [Food] = []
}
