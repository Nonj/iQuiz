//
//  Question.swift
//  iQuiz
//
//  Created by Nattanon Bunyatipanon on 11/3/18.
//  Copyright © 2018 Nattanon Bunyatipanon. All rights reserved.
//

import Foundation
import UIKit

class Question {
    var question: String!
    var choices: [String]!
    var correctChoice: Int
    
    init(question: String, choices: [String], correctChoice: Int) {
        self.question = question
        self.choices = choices
        self.correctChoice = correctChoice
    }
}
