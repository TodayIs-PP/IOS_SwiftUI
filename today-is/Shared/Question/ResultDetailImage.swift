//
//  ResultDetailImage.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct ResultDetailImage: View {
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
        .frame(width: 70, height: 70)
        .clipShape(Rectangle())
        .overlay {
            Rectangle().stroke(.black, lineWidth: 2)
        }
        .padding(.trailing, 20)
    }
}

struct ResultDetailImage_Previews: PreviewProvider {
    static var previews: some View {
        ResultDetailImage()
    }
}
