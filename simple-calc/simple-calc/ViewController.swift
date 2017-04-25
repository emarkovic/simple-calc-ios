//
//  ViewController.swift
//  simple-calc
//
//  Created by Personal on 4/18/17.
//  Copyright © 2017 Ena Markovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var nums = [0]
    var isTyping = false
    var operation = ""
    var history = [String]()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func numTapped(_ sender: Any) {
        let button = sender as! UIButton
        let number = button.currentTitle!

        if !isTyping {
            self.displayLabel.text = number
            isTyping = true
        } else {
            self.displayLabel.text = self.displayLabel.text! + number
        }
        
        if operation == "" {
            nums[0] = Int(self.displayLabel.text!)!
        } else {
            nums.append(Int(self.displayLabel.text!)!)
        }
        
    }
    
    @IBAction func calcTapped(_ sender: Any) {
        let button = sender as! UIButton
        operation = button.currentTitle!
        isTyping = false
        if operation == "fact" {
            var product = 1
            for index in 1...nums[0] {
                product *= index
            }
            self.displayLabel.text = "\(product)"
            
            nums = [product]
            operation = ""
        }
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        self.displayLabel.text = "0"
        nums = [0]
        operation = ""
        
    }
    
    @IBAction func equalsTapped(_ sender: Any) {
        var value: Int?
        var error = ""
        isTyping = false;
        let firstNum = nums[0]
        var opStr = ""
        
        let secondNum: Int?
        if nums.count >= 2 {
            secondNum = nums[1]
        } else {
            secondNum = 0
        }
        
        if operation == "" {
            value = firstNum
        } else {
            switch operation {
            case "mod":
                opStr = "%"
                
                if secondNum == 0 {
                    value = firstNum
                } else {
                    var num = Double(firstNum) / Double(secondNum!)
                    num = num - Double(firstNum / secondNum!)
                    value = Int(num * Double(secondNum!))
                }
            case "div":
                opStr = "/"
                
                if secondNum! == 0 {
                    error = "Error"
                } else {
                    value = firstNum / secondNum!
                }
            case "mult":
                opStr = "x"
                
                value = firstNum * secondNum!
            case "sub":
                opStr = "-"
                
                value = firstNum - secondNum!
            case "add":
                opStr = "+"
                
                value = firstNum + secondNum!
            case "avg":
                opStr = "avg"
                
                var sum = 0;
                for num in nums {
                    sum += num
                }
                value = sum / nums.count
            case "count":
                opStr = "cnt"
                
                value = nums.count
            default:
                value = 0
            }
        }
        
        if error != "" {
            self.displayLabel.text = error
            createHistString(opStr, error)
            nums = [0]
        } else {
            self.displayLabel.text = "\(value!)"
            createHistString(opStr, "\(value!)")
            nums = [value!]
        }
        operation = ""
        opStr = ""
    }
    
    func createHistString(_ opString: String, _ value: String) {
        var histString = ""
        for (index, num) in nums.enumerated() {
            histString += "\(num) ";
            if index != nums.count - 1 {
                histString += opString + " ";
            }
        }
        histString += "= " + value
        history.append(histString)
    }

    
//    @IBAction func historyTapped(_ sender: Any) {
//        let mainSB = UIStoryboard(name: "Main", bundle: nil)
//        let historyVC : HistoryViewController = mainSB.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
//        historyVC.historyItems = self.history
//        historyVC.mainViewController = self
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "historyBtnSegue" {
            let historyViewController: HistoryViewController = segue.destination as! HistoryViewController
            historyViewController.historyItems = self.history
        }
    }
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

