//
//  Game.swift
//  OpenQuizz
//
//  Created by Martin Flament on 27/06/2020.
//  Copyright © 2020 Martin Flament. All rights reserved.
//

import Foundation

class Game {
    var score = 0

    private var questions = [Question]()
    private var currentIndex = 0

    var state: State = .ongoing // ???

    enum State {
        case ongoing, over
    }

    var currentQuestion: Question {
        return questions[currentIndex] // Connecter le controleur et le modèle  ??
    }

    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
        
        QuestionManager.shared.get { (questions) in
            self.questions = questions
            self.state = .ongoing
            
            let name = Notification.Name(rawValue: "QuestionLoaded")
            let notification = Notification(name: name)
            NotificationCenter.default.post(notification)
        }
    }

    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect! && answer) || (!currentQuestion.isCorrect! && !answer) {
            score += 1
        }
        goToNextQuestion()
    }

    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }

    private func finishGame() {
        state = .over
    }
}
