//
//  ViewController.swift
//  WWtBM_GeekBrains
//
//  Created by Роман Шичкин on 10.08.2021.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toGameSegue":
            if let destination = segue.destination as? GameViewController {
                destination.gameVCDelegate = self
                destination.onGameEnd = { [weak self] (result) in
                    guard let self = self else { return }
                    
                    self.didEndGame(with: result)
                }
            }
        default:
            break
        }
    }


}

extension MainMenuViewController: GameViewControllerDelegate {
    func didEndGame(with result: Int) {
        resultLabel.text = "Правильных ответов: \(result)"
    }
}
