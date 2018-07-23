//
//  TriviaQuestion.swift
//  Trivia Game
//
//  Created by Izakk Camillo on 7/23/18.
//  Copyright © 2018 Izakk Camillo. All rights reserved.
//

import Foundation

class TriviaQuestion {
    //Properties
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
    
    //Computed Property
    var correctAnswer: String {
        return answers[correctAnswerIndex]
    }
    
    //Initializer
    init(question: String, answers: [String], correctAnswerIndex: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
}
