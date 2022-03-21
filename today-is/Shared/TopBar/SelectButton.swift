//
//  SelectButton.swift
//  today-is
//
//  Created by 이주열 on 2022/03/14.
//

import SwiftUI

struct SelectButton: View {
    @Binding var isHome: Bool
    var menuList = Text("메뉴 리스트").foregroundColor(Color.black)
    var menuSelect = Text("메뉴 정하기").foregroundColor(Color.black)
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.isHome = true
            }) {
                isHome ? menuList.bold() : menuList
            }
            Spacer()
            Button(action: {
                self.isHome = false
            }) {
                isHome ? menuSelect : menuSelect.bold()
            }
            Spacer()
        }
        .overlay {
            Rectangle().stroke(.black, lineWidth: 1)
        }
    }
}

struct SelectButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectButton(isHome: .constant(true))
    }
}
