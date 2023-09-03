//
//  ViewController.swift
//  Project2
//
//  Created by William Adams on 8/31/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }

    func askQuestion(acton: UIAlertAction! = nil){
        questionsAsked += 1
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())       Score: \(score)"
    }
    
    //            challenge 2 of day 21
    func showFinalScore(action: UIAlertAction! = nil) {
        let ac = UIAlertController(title: "Final Score", message: "Your final score: \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        // reset game stats
        questionsAsked = 0
        score = 0
    }
    
    func updateTitle() {
//        challenge 1 of day 21
        title = "\(countries[correctAnswer].uppercased())       Score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = """
            Nice Job!
            """
        } else {
            title = "Incorrect"
//            score -= 1
            
//            challenge 3 of day 21
            message = """
            You selected the flag of \(countries[sender.tag].uppercased())!
            """
        }
        
        updateTitle()
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if questionsAsked < 10 {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        } else {
            ac.addAction(UIAlertAction(title: "See Final Score", style: .default, handler: showFinalScore))
        }
    
        present(ac, animated: true)
    }
    
    
}

