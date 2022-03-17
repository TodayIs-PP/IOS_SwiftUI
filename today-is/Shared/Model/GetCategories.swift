//
//  GetCategories.swift
//  today-is
//
//  Created by 이주열 on 2022/03/15.
//

import Foundation

struct GetCategories: Hashable, Decodable {
    var message: String?
    var data: [String]?
}
