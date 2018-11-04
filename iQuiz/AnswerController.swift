//
//  AnswerController.swift
//  iQuiz
//
//  Created by Nattanon Bunyatipanon on 11/3/18.
//  Copyright © 2018 Nattanon Bunyatipanon. All rights reserved.
//

import UIKit



class AnswerController: UIViewController {
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    
    var questionAnswered = 0
    var questionRight = 0
    var correctAnswer = 0
    var lastSelectedAnswer: Int = -1
    var questionList: [Question] = []
    var question: String = ""
    var fromTopic: AnyObject = NSNull.self
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionAnswered += 1
        
        if self.questionList.count > self.questionAnswered {
            btnNext.setTitle("Next Question", for: .normal)
        } else {
            btnNext.setTitle("Finish", for: .normal)
        }
        
        lblQuestion.text = self.question
        
        if(self.correctAnswer == self.lastSelectedAnswer){
            questionRight += 1
            lblResult.text = "Correct! Current Score: \(questionRight) / \(questionAnswered)"
        }else{
            lblResult.text = "Wrong, Current Score: \(questionRight) / \(questionAnswered)"
        }
    }
    
    
    @IBAction func nextView(_ sender: Any) {
        if(self.questionList.count == self.questionAnswered){
            performSegue(withIdentifier: "toFinish", sender: self)
        }else{
            performSegue(withIdentifier: "showQuestion", sender: self)
        }
    }
    
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
