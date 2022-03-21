//
//  QuestionView.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack {
            QuestionBox()
                .padding(.vertical)
            SearchView()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
