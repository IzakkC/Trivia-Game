//
//  QuizViewController.swift
//  Trivia Game
//
//  Created by Izakk Camillo on 7/20/18.
//  Copyright © 2018 Izakk Camillo. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let newQuestion = TriviaQuestion(question: "What color is the sky?", answers: ["Red", "Mauve", "Aubregine", "Blue"], correctAnswerIndex: 3)
        questionLabel.text = newQuestion.question
        answer1Button.setTitle(newQuestion.answers[0], for: .normal)
        answer2Button.setTitle(newQuestion.answers[1], for: .normal)
        answer3Button.setTitle(newQuestion.answers[2], for: .normal)
        answer4Button.setTitle(newQuestion.answers[3], for: .normal)
        
        print("The correct answer is: \(newQuestion.correctAnswer)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

