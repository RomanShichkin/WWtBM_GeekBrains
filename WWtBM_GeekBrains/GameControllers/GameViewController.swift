//
//  GameViewController.swift
//  WWtBM_GeekBrains
//
//  Created by Роман Шичкин on 10.08.2021.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(with result: Int)
}

final class GameViewController: UIViewController {

    weak var gameVCDelegate: GameViewControllerDelegate?
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    var mode: Mode = .consistent
    
//    private let questionStrategy = QuestionStrategy()
    var currentQuestion = 0
    var questionsOrder = [Int]()
    var score = 0
    var rightAnswer:UInt32 = 0
    var onGameEnd: ((Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createQuestionStrategy()
        answerAButton.layer.cornerRadius = 10
        answerAButton.tag = 1
        answerBButton.layer.cornerRadius = 10
        answerBButton.tag = 2
        answerCButton.layer.cornerRadius = 10
        answerCButton.tag = 3
        answerDButton.layer.cornerRadius = 10
        answerDButton.tag = 4
        
        let session = GameSession()
        
        session.onGameEnd = { [weak self] (result) in
            guard let self = self else { return }
            
            self.onGameEnd?(result)
            self.dismiss(animated: true, completion: nil)
        }
        
        questionsOrder = questionStrategy.currentQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        currentQuestion = questionsOrder[0]
        nextQuestion()
    }
    
    @IBAction func btn(_ sender: UIButton) {
        
        if sender.tag == Int(rightAnswer) {
            print("RIGHT!!")
            score += 1
        }else {
            print("WRONG!!!!!")
        }
        
        if currentQuestion != questions.count {
            nextQuestion()
            
        }else {
            let record = Record(date: Date(), score: score)
            GameSingleton.shared.addRecord(record: record)
            onGameEnd?(score)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func nextQuestion() {
        
        let question = questionsOrder[currentQuestion]
        
        questionLabel.text = questions[question]
        
        var wrongAnswers = answers[question].filter(){$0 != answers[question][0]}
        wrongAnswers.shuffle()
        
        rightAnswer = UInt32.random(in: 1...4)
//            arc4random_uniform(4) + 1
        
        var button = UIButton()
        
        for i in 1...answers[question].count {
            
            button = view.viewWithTag(i) as! UIButton
            
            if i < Int(rightAnswer) {
                button.setTitle(wrongAnswers[i-1], for: .normal)
            } else if i == Int(rightAnswer) {
                button.setTitle(answers[question][0], for: .normal)
            } else {
                button.setTitle(wrongAnswers[i-2], for: .normal)
            }
            
        }
        
        currentQuestion += 1
        
    }

    private func createQuestionStrategy() -> QuestionStrategy {
        switch mode {
        case .consistent:
            return ConsistentQuestionStrategy()
        case .random:
            return RandomQuestionStrategy()
        }
    }
    
}
