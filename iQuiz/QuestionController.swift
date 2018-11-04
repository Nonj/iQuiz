//
//  QuestionController.swift
//  iQuiz
//
//  Created by Nattanon Bunyatipanon on 11/3/18.
//  Copyright © 2018 Nattanon Bunyatipanon. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {
    

    var fromTopic: Topic!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var SubmitBTN: UIButton!
    var correctAnswer : Int = 0
    var lastSelectedAnswer: Int = -1
    var questionAnswered = 0;
    var questionRight = 0;
    var questionList : [Question] = []
    var question: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionList = self.fromTopic.questions
        let toAsk : Question = self.questionList[self.questionAnswered]
        self.correctAnswer = toAsk.correctChoice
        self.question = toAsk.question
        
        self.questionLabel.text = "\((toAsk.question)!)"
        self.answer1.setTitle((toAsk.choices[0]), for: .normal)
        self.answer2.setTitle((toAsk.choices[1]), for: .normal)
        self.answer3.setTitle((toAsk.choices[2]), for: .normal)
        self.answer4.setTitle((toAsk.choices[3]), for: .normal)
    }
    
    
    @IBAction func actnSubmit(_ sender: Any) {
        if(lastSelectedAnswer == -1){
            let alert = UIAlertController(title: "No Selection", message: "Please select an answer to continue.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }else{
            performSegue(withIdentifier: "showAnswer", sender: self)
        }
    }

    
    @IBAction func actnAnswerOne(_ sender: Any) {
        self.lastSelectedAnswer = 0
        self.answer1.backgroundColor = UIColor.lightGray
        answer2.backgroundColor = UIColor.white
        answer3.backgroundColor = UIColor.white
        answer4.backgroundColor = UIColor.white
    }
    

    @IBAction func actnAnswerTwo(_ sender: Any) {
        self.lastSelectedAnswer = 1
        self.answer2.backgroundColor = UIColor.lightGray
        self.answer1.backgroundColor = UIColor.white
        self.answer3.backgroundColor = UIColor.white
        self.answer4.backgroundColor = UIColor.white
        
    }

    
    @IBAction func actnAnswerThree(_ sender: Any) {
        self.lastSelectedAnswer = 2
        self.answer3.backgroundColor = UIColor.lightGray
        answer1.backgroundColor = UIColor.white
        answer2.backgroundColor = UIColor.white
        answer4.backgroundColor = UIColor.white
    }
    
    
    @IBAction func actnAnswerFour(_ sender: Any) {
        self.lastSelectedAnswer = 3
        self.answer4.backgroundColor = UIColor.lightGray
        answer1.backgroundColor = UIColor.white
        answer2.backgroundColor = UIColor.white
        answer3.backgroundColor = UIColor.white
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showAnswer"){
            let dest = segue.destination as! AnswerController
            dest.lastSelectedAnswer = self.lastSelectedAnswer
            dest.questionAnswered = self.questionAnswered
            dest.questionRight = self.questionRight
            dest.correctAnswer = self.correctAnswer
            dest.questionList = self.questionList
            dest.question = self.question
            dest.fromTopic = self.fromTopic
        }
    }
}
