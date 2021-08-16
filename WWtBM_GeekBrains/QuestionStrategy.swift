//
//  QuestionStrategy.swift
//  WWtBM_GeekBrains
//
//  Created by Роман Шичкин on 16.08.2021.
//

import Foundation

protocol QuestionStrategy: AnyObject {
    func currentQuestion() -> [Int]
}
