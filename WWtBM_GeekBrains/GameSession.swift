//
//  GameSession.swift
//  WWtBM_GeekBrains
//
//  Created by Роман Шичкин on 12.08.2021.
//

import Foundation

final class GameSession {
    var onGameEnd: ((Int) -> Void)?
    var numberOfQuestions: Int = 0
    var rightAnswers: Int = 0
    
    func clearGameSession() {
        numberOfQuestions = 0
        rightAnswers = 0
    }
}
