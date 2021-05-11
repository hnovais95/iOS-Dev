//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

import UIKit

final class QuizViewController: UIViewController, Storyboarded {
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    weak var coordinator: MainCoordinator?
    let viewModel = QuizViewModel()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
        startAnimation()
        getNewQuiz()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = sender.tag
        viewModel.validadeAnswer(index)
        getNewQuiz()
    }
    
    func startAnimation() {
        timerView.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 10.0, delay: 0, options: .curveLinear, animations: { [unowned self] in
            self.timerView.frame.size.width = 0
        }) { [unowned self] (sucess) in
            self.showResult()
        }
    }
        
    func getNewQuiz() {
        guard let quiz = viewModel.getNewQuiz() else {
            for i in 0..<answerButtons.count {
                answerButtons[i].isEnabled = false
            }
            return
        }
        setupQuiz(quiz)
    }
    
    func setupQuiz(_ quiz: Quiz) {
        questionLabel.text = quiz.question
        for i in 0..<quiz.options.count {
            answerButtons[i].setTitle(quiz.options[i], for: .normal)
        }
    }
    
    func showResult() {
        coordinator?.showResult()
    }
}
