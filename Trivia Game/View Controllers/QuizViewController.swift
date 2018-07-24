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
    @IBOutlet weak var scoreLabel: UILabel!
    
    //Property Observers
    var currentQuestion: TriviaQuestion! {
        didSet {
            //When currentQuestion is set, update the UI with values from that question
            questionLabel.text = currentQuestion.question
            answer1Button.setTitle(currentQuestion.answers[0], for: .normal)
            answer2Button.setTitle(currentQuestion.answers[1], for: .normal)
            answer3Button.setTitle(currentQuestion.answers[2], for: .normal)
            answer4Button.setTitle(currentQuestion.answers[3], for: .normal)
        }
    }
    
    var score = 0 {
        didSet {
            //Update the scoreLabel's text whenever the score changes
            scoreLabel.text = "\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let newQuestion = TriviaQuestion(question: "What color is the sky?", answers: ["Red", "Mauve", "Aubregine", "Blue"], correctAnswerIndex: 3)
       currentQuestion = newQuestion
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkAnswer(selectedButtonTag: Int) {
        if selectedButtonTag == currentQuestion.correctAnswerIndex {
            //They got it right
            score += 1
        } else {
            //They got it wrong
        }
    }
    
    @IBAction func answer1ButtonTapped(_ sender: UIButton) {
        print(sender.tag)
    }
    

}




























