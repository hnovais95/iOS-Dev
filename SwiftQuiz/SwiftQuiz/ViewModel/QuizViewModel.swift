//
//  QuizViewModel.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

final class QuizViewModel {
    private let quizManager = QuizManager.shared
    
    func getNewQuiz() -> Quiz? {
        return quizManager.getNewQuiz()
    }
    
    func validadeAnswer(_ index: Int) {
        return quizManager.validadeAnswer(index)
    }
    
    func getResult() -> Result {
        return quizManager.getResult()
    }
    
    func restart() {
        quizManager.restart()
    }
}
