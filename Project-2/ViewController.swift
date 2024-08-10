//
//  ViewController.swift
//  Project-2
//
//  Created by Kevin Cuadros on 28/07/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalQuestions = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany",
                      "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia",
                      "spain", "uk", "us"]
        
        setButtonStyle()
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "\(countries[correctAnswer].uppercased()) - Score \(String(score)) - Question #\(totalQuestions)"
    }
    
    func setButtonStyle() {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button2.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button3.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    @IBAction func buttonTap(_ sender: UIButton) {
        var titleAlert: String
    
        if sender.tag == correctAnswer {
            titleAlert = "Correct"
            score += 1
        } else {
            titleAlert = "Incorrect that is the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        self.title = "\(countries[correctAnswer].uppercased()) - Score \(String(score)) - Question #\(totalQuestions)"
        
        if totalQuestions == 5 {
            finalAlert()
        } else {
            currentScoreAlert(titleAlert)
        }
    }
    
    func currentScoreAlert(_ titleAlert: String) {
        let ac = UIAlertController(
            title: titleAlert,
            message: "Your Score is \(score)",
            preferredStyle: .alert
        )
        
        ac.addAction(UIAlertAction(
            title: "Continue",
            style: .default,
            handler: askQuestion))
        
        present(ac, animated: true)
        
        totalQuestions += 1
    }
    
    func finalAlert() {
        let ac = UIAlertController(
            title: "Finished game",
            message: "Your Total Score is \(score)",
            preferredStyle: .alert
        )
        
        ac.addAction(UIAlertAction(
            title: "Reset",
            style: .default,
            handler: resetGame))
        
        present(ac, animated: true)
    }
    
    
    func resetGame(action: UIAlertAction) {
        score = 0
        correctAnswer = 0
        totalQuestions = 1
        askQuestion(action: nil)
    }
    

}

