//
//  ViewController.swift
//  calc
//
//  Created by Bruce Ng on 10/21/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numbers : String? = ""
    var numbersArray : [Int] = []
    var operationValue : String = ""
    var result : Int = 0
    var averageResult : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var error: UILabel!
    
    @IBAction func numbers(sender: UIButton) {
        error.text = "Remember to clear after each result"
        let numbersText = sender.currentTitle!
        numbers = numbers! + numbersText
        results.text = numbers
    }
    
    @IBAction func equals(sender: UIButton) {
        if (numbers != nil) {
            if sender.currentTitle != "C"{
                if operationValue != "Fact" {
                    let numbersToPush : Int? = Int(numbers!)!
                    numbersArray.append(numbersToPush!)
                }
                if operationValue == "+" && numbersArray.count == 2 {
                    result = numbersArray[0] + numbersArray[1]
                } else if operationValue == "-" && numbersArray.count == 2{
                    result = numbersArray[0] - numbersArray[1]
                } else if operationValue == "*" && numbersArray.count == 2{
                    result = numbersArray[0] * numbersArray[1]
                } else if operationValue == "/" && numbersArray.count == 2{
                    result = numbersArray[0] /  numbersArray[1]
                } else if operationValue == "%" && numbersArray.count == 2{
                    result = numbersArray[0] %  numbersArray[1]
                } else if operationValue == "Count" {
                    result = numbersArray.count
                } else if operationValue == "Fact" && numbersArray.count == 1 {
                    result = 1
                    if (numbersArray[0] != 0) {
                        for (var index = 1; index <= numbersArray[0]; index++) {
                            result = result * index
                        }
                    }
                } else if operationValue == "Avg" {
                    for (var index = 0; index < numbersArray.count; index++) {
                        result = result + numbersArray[index]
                    }
                    averageResult = Double(result) / Double(numbersArray.count)
                } else {
                    error.text = "Unable to output an answer. Cleared Inputs"
                    result = 0
                }
            } else {
                result = 0
            }
            if (operationValue == "Avg") {
                results.text = String(averageResult)
            } else {
                results.text = String(result)
            }
        }
        numbersArray = []
        numbers = ""
        operationValue = ""
    }
   
    @IBAction func operations(sender: UIButton) {
        if (numbers != nil && numbers != "") {
            let numbersToPush : Int? = Int(numbers!)!
            operationValue = sender.currentTitle!
            numbersArray.append(numbersToPush!)
            numbers = ""
            results.text = operationValue
        } else {
            error.text = "Can't do operation on result"
        }
    }
}

