//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Screen elements
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // quiz data - questions
    var questionNumber: Int = 0
    var questionList: [Question] = [
        Question(title: "A slug's blood is green.", answer: "True", isAnswered: false),
        Question(title: "Approximately one quarter of human bones are in the feet.", answer: "True", isAnswered: false),
        Question(title: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True", isAnswered: false),
        Question(title: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True", isAnswered: false),
        Question(title: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False", isAnswered: false),
        Question(title: "It is illegal to pee in the Ocean in Portugal.", answer: "True", isAnswered: false),
        Question(title: "You can lead a cow down stairs but not up stairs.", answer: "False", isAnswered: false),
        Question(title: "Google was originally called 'Backrub'.", answer: "True", isAnswered: false),
        Question(title: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True", isAnswered: false),
        Question(title: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False", isAnswered: false),
        Question(title: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False", isAnswered: false),
        Question(title: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True", isAnswered: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchQuizQuestion()
    }
    
    func fetchQuizQuestion(){
        
        // Checking if there are any unanswered questions available.
        let availableQuestions = questionList.filter({$0.isAnswered == false}).count
        if availableQuestions == 0 {
            questionLabel.text = "No further questions available"
            trueButton.alpha  = 0
            falseButton.alpha = 0
            return
        }
        
        self.questionNumber = Int.random(in: 0..<questionList.count)
        if questionList[questionNumber].isAnswered {
            fetchQuizQuestion()
        }
        
        // update the label with the selected question
        questionLabel.text = questionList[questionNumber].title
    }
    
    // Handles the user interaction with the true / false button
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // calculating progress to update the progressBar
        let answeredQuestions = Float (questionList.filter({$0.isAnswered == true}).count + 1)
        let availableQuestions = Float(questionList.count)
        let progress = answeredQuestions / availableQuestions
        progressBar.progress = progress
        
        // Marking the question as answered already
        questionList[questionNumber].isAnswered = true
        
        // Checking if the user replied correctly
        if sender.currentTitle == questionList[questionNumber].answer {
            print("Correct answer")
        } else {
            print("incorrect answer")
        }
        
        // fetching the next question
        fetchQuizQuestion()
    }
}
