//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Nikita  on 6/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    
    var countries: [String] = []
    var score = 0
    var correctAnswer = 0
    
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
        
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.imageView?.image = UIImage(named: countries[1])
        buttonThree.imageView?.image = UIImage(named: countries[2])
        
        title = countries[correctAnswer].uppercased()
    }


}

