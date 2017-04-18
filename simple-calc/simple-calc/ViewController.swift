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
        print("\(nums)")
        
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
        let secondNum: Int?
        if nums.count >= 2 {
            secondNum = nums[1]
        } else {
            secondNum = 0
        }
        print("\(nums)")
        
        if operation == "" {
            value = firstNum
        } else {
            switch operation {
            case "mod":
                if secondNum == 0 {
                    value = firstNum
                } else {
                    var num = Double(firstNum) / Double(secondNum!)
                    num = num - Double(firstNum / secondNum!)
                    num = num * Double(secondNum!)
                    value = Int(num)
                }
            case "div":
                if secondNum! == 0 {
                    error = "Error"
                } else {
                    value = firstNum / secondNum!
                }
            case "mult":
                value = firstNum * secondNum!
            case "sub":
                value = firstNum - secondNum!
            case "add":
                value = firstNum + secondNum!
            case "avg":
                var sum = 0;
                for num in nums {
                    sum += num
                }
                value = sum / nums.count
            case "count":
                value = nums.count
            default:
                value = 0
            }
        }
        if error != "" {
            self.displayLabel.text = error
            nums = [0]
        } else {
            self.displayLabel.text = "\(value!)"
            nums = [value!]
        }
        operation = ""
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

