//
//  ViewController.swift
//  Assignment1
//
//  Created by Name: Sarthak Vashistha on 2022-09-24
//Student ID: 301245284
//Name: Neha patel
//Student ID:301280513
//This is the UI design of a calculator which has all the buttons in iphone 13 pro for IOS 16.0 in Xcode 14.0

import UIKit

class ViewController: UIViewController {
    
    enum Operation:String{
        case Add = "+"
        case Subtract = "-"
        case divide = "/"
        case Multiply =  "X"
        case Modulo = "%"
        case PlusMinus = "+/-"
        case equal = "="
        case Null = "Null"
    }
    //result label
    @IBOutlet weak var ResultLabel: UILabel!
    var pressedNumber = ""
    var LHS =  ""
    var RHS = ""
    var result: String = ""
    var currentOperation:Operation = .Null
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultLabel.text = "0"
        
    }
    //Event handlers
  
    
    @IBAction func moduloPressed(_ sender: UIButton) {
        operation(operation: .Modulo)
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        operation(operation: .divide)
    }
    
    @IBAction func Multiply(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func plusminusPressed(_ sender: UIButton) {
     
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
        
    }
    
    @IBAction func OperatorButton_Pressed(_ sender: UIButton) {
        
    }
     
    func operation(operation: Operation){
        if currentOperation != .Null{
            if pressedNumber != "" {
                RHS = pressedNumber
                pressedNumber = ""
                if currentOperation == .Add {
                    result = "\(Double(LHS)! + Double(RHS)!)"
                }else if currentOperation == .Subtract{
                    result = "\(Double(LHS)! - Double(RHS)!)"
                }else if currentOperation == .divide{
                    result = "\(Double(LHS)! / Double(RHS)!)"
                }else if currentOperation == .Multiply{
                    result = "\(Double(LHS)! * Double(RHS)!)"
                }else if currentOperation = .equal{
                    
                }
                LHS = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                     result = "\(Int(Double(result)!))"
                }
                ResultLabel.text = result
            }
            currentOperation = operation
        }else {
            LHS = pressedNumber
            pressedNumber = ""
            currentOperation = operation
        }
    }
    @IBAction func NumberButton_Pressed(_ sender: UIButton) {
        if pressedNumber.count <= 8{
            pressedNumber += "\(sender.tag)"
            ResultLabel.text = pressedNumber
        }
       
    }
    
    
    @IBAction func dot_Pressed(_ sender: UIButton) {
        if pressedNumber.count <= 8{
            pressedNumber += "."
            ResultLabel.text = pressedNumber
        }
    }
    
    @IBAction func ClearButton_Pressed(_ sender: UIButton) {
        pressedNumber = ""
        LHS = ""
        RHS = ""
        result = ""
        currentOperation = .Null
        ResultLabel.text = "0"
    }
    
    @IBAction func ExtraButton_Pressed(_ sender: UIButton) {
        
    }
    
    
    
}

