//
//  Food.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import Foundation

struct Food: Hashable, Codable {
    var _id: String
    var name: String
    var image: String?
    var kind1: String
    var kind2: String?
    var flavor1: String
    var flavor2: String?
    var __v: Int
}
