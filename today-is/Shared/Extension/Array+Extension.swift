//
//  Array+Extension.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/15.
//

import Foundation
 
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
