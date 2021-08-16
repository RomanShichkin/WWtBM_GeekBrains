//
//  RandomQuestions.swift
//  WWtBM_GeekBrains
//
//  Created by Роман Шичкин on 16.08.2021.
//

import Foundation

class RandomQuestionStrategy: QuestionStrategy {
    func currentQuestion() -> [Int] {
        var arr = Array(0...questions.count)
        arr.shuffle()
        return arr
    }
}
