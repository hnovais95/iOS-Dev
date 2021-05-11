//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

struct Quiz: Hashable {
    private(set) var question: String
    private(set) var options: [String]
    private let corretedAnsewer: String
    
    init(question: String, options: [String], corretedAnsewer: String) {
        self.question = question
        self.options = options
        self.corretedAnsewer = corretedAnsewer
    }
    
    func isCorrect(optionIndex: Int) -> Bool {
        let answer = options[optionIndex]
        return answer == corretedAnsewer
    }
}
