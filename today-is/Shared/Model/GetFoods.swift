//
//  GetFoods.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import Foundation

struct GetFoods: Hashable, Decodable {
    var message: String?
    var data: [Food]?
}
