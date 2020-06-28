//
//  ViewController.swift
//  OpenQuizz
//
//  Created by Martin Flament on 27/06/2020.
//  Copyright © 2020 Martin Flament. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()

    @IBOutlet weak var NewGameButton: UIButton!
    @IBOutlet weak var Load: UIActivityIndicatorView!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var questionView: QuestionView!
    
    @IBOutlet weak var questionVieww: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = Notification.Name(rawValue: "QuestionsLoaded")
        NotificationCenter.default.addObserver(self, selector: #selector(questionLoaded), name: name, object: nil)
        
        startNewGame()
    }
    
    @objc func questionLoaded() {
        Load.isHidden = true
        NewGameButton.isHidden = false
        
        questionView.title = game.currentQuestion.title!
        
    }
    
    @IBAction func didTapNewGameButton() {
        startNewGame()
    }
    
    private func startNewGame() {
        Load.isHidden = false
        NewGameButton.isHidden = true
        
        questionView.title = "Loading..."
        questionView.style = .standard
        ScoreLabel.text = "0/10"
        
        game.refresh()
        
        
    }
    
}

