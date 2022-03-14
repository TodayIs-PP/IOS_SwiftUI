//
//  AppBar.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct AppBar: View {
    var body: some View {
        VStack {
            Text("오늘은").font(.title).bold()
            SelectButton()
        }.overlay {
            Rectangle().stroke(.black, lineWidth: 2)
        }
    }
}

struct AppBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar()
    }
}
