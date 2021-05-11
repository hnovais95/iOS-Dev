//
//  InMemoryQuizRepository.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

import Foundation

class InMemoryQuizRepository: QuizRepository {    
    func getAll() -> [Quiz] {
        var quizzes = [Quiz]()
        for quizData in QuizDatabase.quizPool {
            let quiz = Quiz(question: quizData.question, options: quizData.options, corretedAnsewer: quizData.correctAnswer)
            quizzes.append(quiz)
        }
        return quizzes
    }   
}
