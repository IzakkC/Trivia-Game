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
    
  private var score = 0 {
        didSet {
            //Update the scoreLabel's text whenever the score changes
            scoreLabel.text = "\(score)"
        }
    }
    
    var questions: [TriviaQuestion] = []
    
    var questionsPlaceholder: [TriviaQuestion] = []
    
    var currentIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      populateQuestionArray()
        getNewQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateQuestionArray() {
         let Question1 = TriviaQuestion(question: "What color is the sky?", answers: ["Red", "Mauve", "Aubregine", "Blue"], correctAnswerIndex: 3)
         let Question2 = TriviaQuestion(question: "What is 2 + 2?", answers: ["4", "27", "42", "Idk lol"], correctAnswerIndex: 0)
         let Question3 = TriviaQuestion(question: "What was the first computer?", answers: ["Macintosh", "UNIVAC", "ENIAC", "IBM"], correctAnswerIndex: 1)
        questions.append(Question1)
        questions.append(Question2)
        questions.append(Question3)
    }
    
    func getNewQuestion() {
        if questions.count > 0 {
            currentIndex = Int(arc4random_uniform(UInt32(questions.count)))
            currentQuestion = questions[currentIndex]
        } else {
            showGameOverAlert()
        }
    }
    
    func resetGame() {
        score = 0
        
        if questions.count != 0 {
            questionsPlaceholder.append(contentsOf: questions)
            questions.removeAll()
        }
        
        questions = questionsPlaceholder
        questionsPlaceholder.removeAll()
        getNewQuestion()
    }
    
    func showGameOverAlert() {
        let alertController = UIAlertController(title: "Game Over", message: "Your score was \(score).", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Reset", style: .default) { action in
            self.resetGame()
        }
        alertController.addAction(resetAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showCorrectAnswerAlert() {
        let alertController = UIAlertController(title: "Correct!", message: "\(currentQuestion.correctAnswer) is the answer. Good job!", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Thank you!", style: .default) { action in
            self.questionsPlaceholder.append(self.questions[self.currentIndex])
            self.questions.remove(at: self.currentIndex)
            self.getNewQuestion()
        }
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showIncorrectAnswerAlert() {
        let alertController = UIAlertController(title: "Incorrect!", message: "\(currentQuestion.correctAnswer) was the correct answer.", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Oh well...", style: .default) { action in
            self.questionsPlaceholder.append(self.questions[self.currentIndex])
            self.questions.remove(at: self.currentIndex)
            self.getNewQuestion()
        }
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func checkAnswer(selectedButtonTag: Int) {
        if selectedButtonTag == currentQuestion.correctAnswerIndex {
            //They got it right
            showCorrectAnswerAlert()
            score += 1
        } else {
            //They got it wrong
            showIncorrectAnswerAlert()
        }
    }
    
    @IBAction func answer1ButtonTapped(_ sender: UIButton) {
        checkAnswer(selectedButtonTag: sender.tag)
    }
    @IBOutlet weak var resetButtonTapped: UIBarButtonItem!
    
}




























