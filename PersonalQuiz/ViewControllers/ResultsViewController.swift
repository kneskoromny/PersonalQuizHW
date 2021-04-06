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
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    var answers: [Answer]!
    
    private var result = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerTypeCounter()
   
    }
    
    private func answerTypeCounter() {
        
        
        var animalCounter = ["dog": 0, "cat": 0, "rabbit": 0, "turtle": 0]
        var dog = 0, cat = 0, rabbit = 0, turtle = 0
        
        for answer in answers {
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
                result = animal
            }
        }
    }

}
