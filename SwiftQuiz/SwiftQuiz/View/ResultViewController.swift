//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

import UIKit

final class ResultViewController: UIViewController, Storyboarded {
    @IBOutlet weak var answeredLabel: UILabel!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var wrongAnswersLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    weak var coordinator: MainCoordinator?
    let viewModel = QuizViewModel()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showResult()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func restartQuizTapped(_ sender: Any) {
        viewModel.restart()
        coordinator?.startQuiz()
    }
    
    func showResult() {
        let result = viewModel.getResult()
        answeredLabel.text = String(format: "Perguntas respondidas: %02d", result.numberAnswers)
        correctAnswersLabel.text = String(format: "Perguntas corretas: %02d", result.numberCorrectAnswers)
        wrongAnswersLabel.text = String(format: "Perguntas erradas: %02d", result.numberWrongAnswers)
        scoreLabel.text = String(format: "%.0f%%", result.score)
    }
}
