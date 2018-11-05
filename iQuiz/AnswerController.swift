//
//  AnswerController.swift
//  iQuiz
//
//  Created by Nattanon Bunyatipanon on 11/3/18.
//  Copyright © 2018 Nattanon Bunyatipanon. All rights reserved.
//

import UIKit



class AnswerController: UIViewController {
    
    // Fields
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    var questionAnswered = 0
    var questionRight = 0
    var correctAnswer = 0
    var correctAnswerString = ""
    var lastSelectedAnswer: Int = -1
    var questionList: [Question] = []
    var question: String = ""
    var fromTopic: AnyObject = NSNull.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionAnswered += 1 // Increment Questions Answered
        
        // Logic for button text
        if self.questionList.count > self.questionAnswered {
            btnNext.setTitle("Next Question", for: .normal)
        } else {
            btnNext.setTitle("Finish", for: .normal)
        }
        
        // Setting Question
        lblQuestion.text = self.question
        
        // Logic for displaying results
        if(self.correctAnswer == self.lastSelectedAnswer){
            questionRight += 1
            lblResult.text = "Correct! The answer was \(self.correctAnswerString). Current Score: \(self.questionRight) / \(questionAnswered)"
        }else{
            lblResult.text = "Wrong! The answer was \(self.correctAnswerString). Current Score: \(self.questionRight) / \(self.questionAnswered)"
        }
    }
    
    
    // Back Button Func
    @IBAction func btnBackToMain(_ sender: Any) {
        performSegue(withIdentifier: "toMainFromAnswer", sender: self)
    }
    
    
    // Swipe Right Func
    @IBAction func swipeRight(_ sender: Any) {
        performSegue(withIdentifier: "toMainFromAnswer", sender: self)
    }
    
    
    // Swipe Left Func
    @IBAction func swipeLeft(_ sender: Any) {
        if(self.questionList.count == self.questionAnswered){
            performSegue(withIdentifier: "toFinish", sender: self)
        }else{
            performSegue(withIdentifier: "showQuestion", sender: self)
        }
    }
    
    
    // Next Button Func
    @IBAction func nextView(_ sender: Any) {
        if(self.questionList.count == self.questionAnswered){
            performSegue(withIdentifier: "toFinish", sender: self)
        }else{
            performSegue(withIdentifier: "showQuestion", sender: self)
        }
    }
    
    
    // Preparing data for next segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toFinish"){
            let dest = segue.destination as! FinishedController
            dest.questionRight = self.questionRight
            dest.questionAnswered = self.questionAnswered
        }else if (segue.identifier == "showQuestion"){
            let dest = segue.destination as! QuestionController
            dest.questionAnswered = questionAnswered
            dest.questionRight = questionRight
            dest.questionList = self.questionList
            dest.fromTopic = (self.fromTopic as! Topic)
        }
    }

}
