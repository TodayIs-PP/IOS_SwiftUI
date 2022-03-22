//
//  ResultDetailImage.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct ResultDetailImage: View {
    var imageName: String?
    
    func getImage() -> UIImage? {
        if let notNilImageName = imageName {
            let url = URL(string: "http://localhost:3000/" + notNilImageName)
            var image: UIImage?

            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    image = UIImage(data: data!)
                }
            }
            return image
        }
        else {
            return nil
        }
    }
    
    var body: some View {
        
        let image = getImage()

        if let image = image {
            Image(uiImage: image)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Rectangle())
                .overlay {
                    Rectangle().stroke(.black, lineWidth: 2)
                }
                .padding(.trailing, 20)
        }
        else {
            Image("TodayIs_icon")
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Rectangle())
                .overlay {
                    Rectangle().stroke(.black, lineWidth: 2)
                }
                .padding(.trailing, 20)
        }
    }
}

struct ResultDetailImage_Previews: PreviewProvider {
    static var previews: some View {
        ResultDetailImage()
    }
}
