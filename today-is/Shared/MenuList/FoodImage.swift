//
//  FoodImage.swift
//  today-is
//
//  Created by 이주열 on 2022/03/11.
//

import SwiftUI

struct FoodImage: View {
    var imageName: String?
    
    var body: some View {
        
        AsyncImage(url: URL(string: "http://localhost:3000/\(imageName!)")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                Image("TodayIs_icon")
                    .resizable()
            } else {
                Image("TodayIs_icon")
                    .resizable()
            }
        }
        .frame(width: 185, height: 190)
        .clipShape(Rectangle())
        .overlay {
            Rectangle().stroke(.black, lineWidth: 2)
        }
    }
}

struct FoodImage_Previews: PreviewProvider {
    static var previews: some View {
        FoodImage(imageName: "1647220030850.jpeg")
    }
}
