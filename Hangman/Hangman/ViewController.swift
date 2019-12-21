//
//  ViewController.swift
//  Hangman
//
//  Created by Christopher Aronson on 12/20/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hangmanLabel: UILabel!
    var guessLabel: UILabel!
    var wordToGuessLabel: UILabel!
    var wrongGuessesTextField: UITextField!
    
    var wordToGuess = ""
    var letterButtons = [UIButton]()
    
    override func loadView() {
        super.loadView()
        
        hangmanLabel = UILabel()
        hangmanLabel.translatesAutoresizingMaskIntoConstraints = false
        hangmanLabel.font = UIFont.systemFont(ofSize: 50)
        
        hangmanLabel.textAlignment = .center
        hangmanLabel.text = "Hangman"
        view.addSubview(hangmanLabel)
        
        guessLabel = UILabel()
        guessLabel.translatesAutoresizingMaskIntoConstraints = false
        guessLabel.font = UIFont.systemFont(ofSize: 30)
        
        guessLabel.textAlignment = .center
        guessLabel.text = "Guess the word in 6 guesses"
        guessLabel.numberOfLines = 0
        view.addSubview(guessLabel)
        
        wordToGuessLabel = UILabel()
        wordToGuessLabel.translatesAutoresizingMaskIntoConstraints = false
        wordToGuessLabel.font = UIFont.systemFont(ofSize: 45)
        
        wordToGuessLabel.numberOfLines = 0
        wordToGuessLabel.textAlignment = .center
        wordToGuessLabel.text = "_ _ _ _"
        view.addSubview(wordToGuessLabel)
        
        wrongGuessesTextField = UITextField()
        wrongGuessesTextField.translatesAutoresizingMaskIntoConstraints = false
        wrongGuessesTextField.placeholder = "Tap a letter to make a guess"
        
        wrongGuessesTextField.textColor = .red
        wrongGuessesTextField.textAlignment = .center
        view.addSubview(wrongGuessesTextField)
        
        let buttonView = UIView()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonView)
        
        NSLayoutConstraint.activate([
            hangmanLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            hangmanLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hangmanLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
            
            guessLabel.topAnchor.constraint(equalTo: hangmanLabel.bottomAnchor, constant: 16),
            guessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guessLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
            
            wordToGuessLabel.topAnchor.constraint(equalTo: guessLabel.bottomAnchor, constant: 32),
            wordToGuessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordToGuessLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            
            wrongGuessesTextField.topAnchor.constraint(equalTo: wordToGuessLabel.bottomAnchor, constant: 32),
            wrongGuessesTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wrongGuessesTextField.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
            
            buttonView.topAnchor.constraint(equalTo: wrongGuessesTextField.bottomAnchor, constant: 32),
            buttonView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -16),
        ])
        
        let width = 90
        let height = 60
        var characters = ["Z", "Y", "X", "W", "V", "U", "T", "S", "R", "Q", "P", "O", "N", "M", "L", "K", "J", "I", "H", "G", "F", "E", "D", "C", "B", "A",]
        
        for row in 0..<7 {
            for column in 0..<4 {
                
                let button = UIButton(type: .system)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
                button.setTitle("\(characters.popLast() ?? " ")", for: .normal)
                
                let frame = CGRect(x: column * width, y: height * row, width: width, height: height)
                button.frame = frame
                
                buttonView.addSubview(button)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func loadWords() {
        
        if let pathToWords = Bundle.main.path(forResource: "Words", ofType: "txt") {
            
            if let contents = try? String(contentsOfFile: pathToWords).components(separatedBy: "\n").randomElement() {
                wordToGuess = contents
            }
        }
    }


}

