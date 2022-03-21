//
//  AppBar.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct AppBar: View {
    @Binding var isHome: Bool
    
    var body: some View {
        VStack {
            Text("오늘은").font(.title).bold()
            SelectButton(isHome: $isHome)
        }
        .background(Color(red: 188 / 255, green: 246 / 255, blue: 179 / 255))
        .overlay {
            Rectangle()
                .stroke(.black, lineWidth: 1)
        }
    }
}

struct AppBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar(isHome: .constant(true))
    }
}
