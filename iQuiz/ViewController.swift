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
    var questions: [String : [Question]] =
        [   "Cars":
                [Question(question: "What is the fastest 0-60 MPH production car as of November 2018?", choices: ["Porsche 918","Ferrari LaFerrari","Lamborghini Huracan Performante","Tesla Roadster"], correctChoice: 3),
                 Question(question: "What is Lamborghini's SUV model called?", choices: ["Aventador", "Focus", "Urus", "Prius"], correctChoice: 2)
                ],
            "Food":
                [Question(question: "Where does curry originate from?", choices: ["India","Thailand","Malaysia","China"], correctChoice: 0),
                 Question(question: "Which fruit has the highest protein content?", choices: ["Bananas","Avocado","Durian","Grapefruit"], correctChoice: 1)
            ],
            "Games":
                [Question(question: "Which real-world animal inspired the creation of the Pokemon series?", choices: ["Butterflies","Lynx","Turtles","Chickens"], correctChoice: 0),
                 Question(question: "What is the highest grossing video game of all time?", choices: ["League of Legends", "Counter Strike - Global Offensive", "Mario Kart Double Dash", "World of Warcraft"], correctChoice: 3)
            ],
            "Songs":
            [Question(question: "Which music video is the most viewed on YouTube of all time?", choices: ["Psy - Gangnam Style","Taylor Swift - Shake It Off","Wiz Khalifa - See You Again","Justin Bieber - Sorry"], correctChoice: 2),
            Question(question: "In what year was Vanilla Ice's \"Ice Ice Baby\" realeased?", choices: ["1991", "1990", "1995", "2000"], correctChoice: 1)
            ]
        ]
    
    
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
            tempTopics.append(Topic(image: self.images[i], title: self.topics[i], description: self.descriptions[i], questions: self.questions[self.topics[i]]!))
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toQuestion", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuestionController {
            destination.fromTopic = self.topicCells[(tblTableView.indexPathForSelectedRow?.row)!]
            
        }
    }
}
