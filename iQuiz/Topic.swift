//
//  Topic.swift
//  iQuiz
//
//  Created by Nattanon Bunyatipanon on 10/27/18.
//  Copyright © 2018 Nattanon Bunyatipanon. All rights reserved.
//

import Foundation
import UIKit

class Topic {
    
    var image: UIImage
    var title: String
    var description: String
    var questions: [Question]
    
    init(image: UIImage, title: String, description: String, questions: [Question]) {
        self.image = image
        self.title = title
        self.description = description
        self.questions = questions
    }
    
}
