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
        view.backgroundColor = UIColor(red: 0.9569, green: 0.9686, blue: 1, alpha: 1.0)
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
        let buttonColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        let buttonSize: CGSize = CGSize(width: 0.0, height: 2.0)
        let buttonShadow: Float = 1.0
        let buttonShadowRadius = 4.0
        let buttonMasksToBounds =  false
        button1.layer.shadowColor = buttonColor.cgColor
        button1.layer.shadowOffset = buttonSize
        button1.layer.shadowOpacity = buttonShadow
        button1.layer.shadowRadius = buttonShadowRadius
        button1.layer.masksToBounds = buttonMasksToBounds
        
        button2.layer.shadowColor = buttonColor.cgColor
        button2.layer.shadowOffset = buttonSize
        button2.layer.shadowOpacity = buttonShadow
        button2.layer.shadowRadius = buttonShadowRadius
        button2.layer.masksToBounds = buttonMasksToBounds
        
        button3.layer.shadowColor = buttonColor.cgColor
        button3.layer.shadowOffset = buttonSize
        button3.layer.shadowOpacity = buttonShadow
        button3.layer.shadowRadius = buttonShadowRadius
        button3.layer.masksToBounds = buttonMasksToBounds
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

