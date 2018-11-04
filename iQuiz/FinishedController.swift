//
//  FinishedController.swift
//  iQuiz
//
//  Created by Nattanon Bunyatipanon on 11/3/18.
//  Copyright © 2018 Nattanon Bunyatipanon. All rights reserved.
//

import UIKit

class FinishedController: UIViewController {

    @IBOutlet weak var lblFinishMessage: UILabel!
    
    var questionRight: Int = 0
    var questionAnswered: Int = 0
    var percentage: Double = 0.0
    
    @IBAction func finishPress(_ sender: Any) {
        performSegue(withIdentifier: "toMainFromFinish", sender: self)
    }
    @IBAction func swipeRight(_ sender: Any) {
        performSegue(withIdentifier: "toMainFromFinish", sender: self)
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
        performSegue(withIdentifier: "toMainFromFinish", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.percentage = (Double(questionRight) / Double(questionAnswered)) * 100.0
        
        if self.percentage == 0 {
            lblFinishMessage.text = "You didn't even try! Your score was: \(self.questionRight) / \(questionAnswered)"
        } else if self.percentage <= 50.0 {
            lblFinishMessage.text = "Keep working on it! Your score was: \(self.questionRight) / \(self.questionAnswered)"
        } else if self.percentage <= 75.0 {
            lblFinishMessage.text = "So close! Your score was: \(self.questionRight) / \(self.questionAnswered)"
        } else {
            lblFinishMessage.text = "You Rock! Your score was: \(self.questionRight) / \(self.questionAnswered)"
        }
    }

}
