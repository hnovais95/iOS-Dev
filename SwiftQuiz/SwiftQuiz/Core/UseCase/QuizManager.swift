//
//  QuizManager.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

import Foundation

final class QuizManager {
    private let quizRepository: QuizRepository
    private var numberAnswers: Int
    private var numberCorrectAnswers: Int
    private var currentQuiz: Quiz?
    private var answeredQuiz: Set<Quiz>
    
    static var shared: QuizManager = {
        let instance = QuizManager()
        return instance
    }()
    
    private init() {
        self.quizRepository = InMemoryQuizRepository()
        self.numberAnswers = 0
        self.numberCorrectAnswers = 0
        self.answeredQuiz = Set<Quiz>()
    }
    
    private func getRandomAvailableQuiz() -> Quiz? {
        let quizPool = quizRepository.getAll()
        let unanswered = answeredQuiz.symmetricDifference(quizPool)
        return unanswered.randomElement()
    }
    
    func getNewQuiz() -> Quiz? {
        var randomAvailableQuiz = getRandomAvailableQuiz()
        if randomAvailableQuiz == nil {
            answeredQuiz.removeAll()
            randomAvailableQuiz = getRandomAvailableQuiz()
        }
        guard let quiz = randomAvailableQuiz else { return nil }
        currentQuiz = quiz
        return quiz
    }
    
    func validadeAnswer(_ index: Int) {
        guard let quiz = currentQuiz else { return }
        numberAnswers += 1
        if quiz.isCorrect(optionIndex: index) {
            numberCorrectAnswers += 1
        }
        answeredQuiz.insert(quiz)
    }
    
    func getResult() -> Result {
        let numberWrongAnswers = numberAnswers - numberCorrectAnswers
        var score = 0.0
        if numberAnswers > 0 {
            score = round((Double(numberCorrectAnswers) / Double(numberAnswers)) * Double(100))
        }
        return Result(numberAnswers, numberCorrectAnswers, numberWrongAnswers, score)
    }
    
    func restart() {
        self.numberAnswers = 0
        self.numberCorrectAnswers = 0
        self.answeredQuiz = Set<Quiz>()
    }
}

extension QuizManager: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
