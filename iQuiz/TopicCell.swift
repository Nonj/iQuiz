//
//  TopicCell.swift
//  iQuiz
//
//  Created by Nattanon Bunyatipanon on 10/27/18.
//  Copyright © 2018 Nattanon Bunyatipanon. All rights reserved.
//

import UIKit

// Custom class for associating our custom cell
// where each field is a referenced to an item in the cell
class TopicCell: UITableViewCell {

    @IBOutlet weak var imgTopic: UIImageView!
    @IBOutlet weak var lblTopic: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    // Function to set up each topic cell and fill them with correct information
    func setTopicCell(topic: Topic) {
        imgTopic.image = topic.image
        lblTopic.text = topic.title
        lblDescription.text = topic.description
    }
    
}
