//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Nikita  on 6/6/22.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
    
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var questionCounterLabel: UILabel!
    
    var countries: [String] = []
    var score = 0
    var correctAnswer = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        countries.append(contentsOf: ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"])
        askQuestion()
        buttonOne.layer.borderWidth = 2
        buttonTwo.layer.borderWidth = 2
        buttonThree.layer.borderWidth = 2
        
        buttonThree.layer.borderColor = UIColor.lightGray.cgColor
        buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
        buttonOne.layer.borderColor = UIColor.lightGray.cgColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareMyScore))
        
    }
    
    func askQuestion(_ action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " | SCORE: \(score)"
        questionCounterLabel.text = "QUESTION \(round)/10"
    }
    func resetGame(_ action: UIAlertAction! = nil){
        score = 0
        round = 0
        askQuestion()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let title = "Good Job!"
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: []) {
            sender.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }

        if sender.tag == correctAnswer{
            score += 10
            round += 1
            
        }
        else{
            score -= 15
            round += 1
            let ac1 = UIAlertController(title: "You're wrong!", message: "You've chosen the \(countries[sender.tag]) flag!", preferredStyle: .alert)
            ac1.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            present(ac1, animated: true, completion: nil)
        }
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: []) {
            sender.transform = CGAffineTransform.identity
        }
        askQuestion()
        
        if round == 10{
            let ac = UIAlertController(title: title, message: "Your score is: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: resetGame))
            
            present(ac, animated: true, completion: nil)
        }
       
        
    }
    
    @objc func shareMyScore(){
        let vc = UIActivityViewController(activityItems: ["Yo bro! Look at my score! I've got \(score) points in the Guess The Flag game!"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
    
    


}

