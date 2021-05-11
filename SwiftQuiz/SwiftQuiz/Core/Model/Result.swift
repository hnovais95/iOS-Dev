//
//  Result.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 10/05/21.
//

struct Result {
    let numberAnswers: Int
    let numberCorrectAnswers: Int
    let numberWrongAnswers: Int
    let score: Double
    
    init(_ numberAnswers: Int,
         _ numberCorrectAnswers: Int,
         _ numberWrongAnswers: Int,
         _ score: Double) {
        self.numberAnswers = numberAnswers
        self.numberCorrectAnswers = numberCorrectAnswers
        self.numberWrongAnswers = numberWrongAnswers
        self.score = score
    }
}
