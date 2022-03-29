//
//  QuestionBox.swift
//  today-is (iOS)
//
//  Created by 이주열 on 2022/03/21.
//

import SwiftUI

let question1 = "최근에 어떤 음식을 드셨나요?"
let question2 = "어떤 종류의 음식을 드시고 싶나요?"
let question3 = "어떤 맛의 음식을 드시고 싶나요?"

var questions: [String] = [question1, question2, question3]

struct QuestionBox: View {
    @Binding var questionNum: Int
    
    var body: some View {
        Text(questions[questionNum])
            .font(.title)
    }
}

struct QuestionBox_Previews: PreviewProvider {
    static var previews: some View {
        QuestionBox(questionNum: .constant(0))
    }
}
