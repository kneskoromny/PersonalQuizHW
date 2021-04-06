//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами +
    // 2. Определить наиболее часто встречающийся тип животного +
    // 3. Отобразить результат в соответсвии с этим животным +
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet weak var resultEmojiLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
  
    var userAnswers: [Answer]!
 
    private var userAnswersResult = ""
    private var correctAnimal: Answer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for answer in userAnswers {
            print(answer)
        }
        
        answerTypeCounter()
        print(userAnswersResult)
        
        showTitleAndDefenition()
   
    }
    
    private func answerTypeCounter() {
       
        var animalCounter = ["dog": 0, "cat": 0, "rabbit": 0, "turtle": 0]
        var dog = 0, cat = 0, rabbit = 0, turtle = 0
        
        for answer in userAnswers {
            switch answer.type {
            case .dog:
                dog += 1
                animalCounter.updateValue(dog, forKey: "dog")
            case .cat:
                cat += 1
                animalCounter.updateValue(cat, forKey: "cat")
            case .rabbit:
                rabbit += 1
                animalCounter.updateValue(rabbit, forKey: "rabbit")
            default:
                turtle += 1
                animalCounter.updateValue(turtle, forKey: "turtle")
            }
        }
        let maximumValue = animalCounter.values.sorted().last!
        
        for (animal, count) in animalCounter {
            if count == maximumValue {
                userAnswersResult = animal
            }
        }
    }
    private func showTitleAndDefenition() {
        
        for _ in userAnswers {
        if userAnswersResult == "dog" {
            correctAnimal = Answer(title: "dog", type: .dog)
            resultEmojiLabel.text = "Вы - \(String((correctAnimal?.type.rawValue)!))"
            resultTextLabel.text = correctAnimal?.type.definition
        }  else if userAnswersResult == "cat" {
            correctAnimal = Answer(title: "cat", type: .cat)
            resultEmojiLabel.text = "Вы - \(String((correctAnimal?.type.rawValue)!))"
            resultTextLabel.text = correctAnimal?.type.definition
        } else if userAnswersResult == "rabbit" {
            correctAnimal = Answer(title: "rabbit", type: .rabbit)
            resultEmojiLabel.text = "Вы - \(String((correctAnimal?.type.rawValue)!))"
            resultTextLabel.text = correctAnimal?.type.definition
        } else if userAnswersResult == "turtle" {
            correctAnimal = Answer(title: "turtle", type: .turtle)
            resultEmojiLabel.text = "Вы - \(String((correctAnimal?.type.rawValue)!))"
            resultTextLabel.text = correctAnimal?.type.definition
        }
    }


}
}
