//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultEmojiLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    var userAnswers: [Answer]!
    
    private var userAnswersResult: String? 
    private var correctAnimal: Answer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        answerTypeCounter()
        
        showTitleAndDefenition()
        
    }
    
    private func answerTypeCounter() {
        
        var answersCounter = ["dog": 0, "cat": 0, "rabbit": 0, "turtle": 0]
        
        var answerDog = 0,
            answerCat = 0,
            answerRabbit = 0,
            answerTurtle = 0
        
        for answer in userAnswers {
            switch answer.type {
            case .dog:
                answerDog += 1
                answersCounter.updateValue(answerDog, forKey: "dog")
            case .cat:
                answerCat += 1
                answersCounter.updateValue(answerCat, forKey: "cat")
            case .rabbit:
                answerRabbit += 1
                answersCounter.updateValue(answerRabbit, forKey: "rabbit")
            default:
                answerTurtle += 1
                answersCounter.updateValue(answerTurtle, forKey: "turtle")
            }
        }
        let maximumValueAnswers = answersCounter.values.sorted().last!
        
        for (animal, count) in answersCounter {
            if count == maximumValueAnswers {
                userAnswersResult = animal
            }
        }
    }
    private func showTitleAndDefenition() {
        
        if userAnswersResult == "dog" {
            sendParametersToView(title: "dog", type: .dog)
            
        }  else if userAnswersResult == "cat" {
            sendParametersToView(title: "cat", type: .cat)
            
        } else if userAnswersResult == "rabbit" {
            sendParametersToView(title: "rabbit", type: .rabbit)
            
        } else if userAnswersResult == "turtle" {
            sendParametersToView(title: "turtle", type: .turtle)
        }
    }
    
    private func sendParametersToView(title: String, type: AnimalType) {
        correctAnimal = Answer(title: title, type: type)
        resultEmojiLabel.text = "Вы - \(String((correctAnimal?.type.rawValue)!))"
        resultTextLabel.text = correctAnimal?.type.definition
    }
    
    
}

