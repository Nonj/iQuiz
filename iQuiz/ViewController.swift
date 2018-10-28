//
//  ViewController.swift
//  iQuiz
//
//  Created by Nattanon Bunyatipanon on 10/26/18.
//  Copyright © 2018 Nattanon Bunyatipanon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblTableView: UITableView!
    
    var topicCells: [Topic] = []
    var images: [UIImage] = [#imageLiteral(resourceName: "laf"),#imageLiteral(resourceName: "food"),#imageLiteral(resourceName: "games"),#imageLiteral(resourceName: "songs")]
    var topics: [String] = ["Cars", "Food", "Games", "Songs"]
    var descriptions: [String] = ["These quizzes will be all about cars!", "These quizzes will be all about food!", "These quizzes will be all about games!", "These quizzes will be all about songs!"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topicCells = createArrays()
        tblTableView.delegate = self
        tblTableView.dataSource = self
    }
    
    
    
    // Settings Button Function for alert popups
    @IBAction func btnOnSettingsTap(_ sender: Any) {
        // Creating Alert popup
        let alert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
        
        // Creating the "OK" action button
        let actionOK = UIAlertAction(title: "Ok", style: .default) {
            (action) in
            //print("Test Action")
        }
        
        // Add action button to alert popup
        alert.addAction(actionOK)
        
        // Presenting it to user
        present(alert, animated: true, completion: nil)
    }
    
    
    func createArrays() -> [Topic] {
        var tempTopics: [Topic] = []
        
        for i in 0...self.images.count - 1 {
            tempTopics.append(Topic(image: self.images[i], title: self.topics[i], description: self.descriptions[i]))
        }
        
        return tempTopics
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Returns the number of rows we have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topicCells.count
    }
    
    // Configuring every cell as it appears
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = self.topicCells[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell") as! TopicCell
        
        cell.setTopicCell(topic: info)
        return cell
    }
}
