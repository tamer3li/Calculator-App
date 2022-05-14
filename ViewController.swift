//
//  ViewController.swift
//  simpleCalculator
//
//  Created by tamerali on 25/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    var inputNumber1 : Double?
    var inputNumber2 : Double?
    
    enum Operation {
        case addition
        case subtraction
        case multiplication
        case division
    }
    var operationChosen : Operation = Operation.addition
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearScreenAction(_ sender: UIButton) {
        inputNumber1 = 0
        inputNumber2 = 0
        inputTextField.text?.removeAll()
        outputLabel.text = "Answer"
    }
    
    @IBAction func pressAddButton(_ sender: UIButton) {
        operationChosen = .addition
        storeInput(inputNumber: &inputNumber1)
    }
    
    @IBAction func pressSubtractButton(_ sender: UIButton) {
        operationChosen = .subtraction
        storeInput(inputNumber: &inputNumber1)
    }
    
    @IBAction func pressMultiplyButton(_ sender: UIButton) {
        operationChosen = .multiplication
        storeInput(inputNumber: &inputNumber1)
        
    }
    
    @IBAction func pressDivideButton(_ sender: UIButton) {
        operationChosen = .division
        storeInput(inputNumber: &inputNumber1)
    }
    
    @IBAction func calculateAnswerAction(_ sender: UIButton) {
        storeInput(inputNumber: &inputNumber2)
        guard let input1 = inputNumber1 else {
            print("Invalid inputNumber1")
            return
        }
        guard let input2 = inputNumber2 else {
            print("Invalid inputNumber2")
            return
        }
        var answer : Double = 0
        switch operationChosen {
        case .addition:
            answer = input1 + input2
        case .subtraction:
            answer = input1 - input2
        case .multiplication:
            answer = input1 * input2
        case .division:
            answer = input1 / input2
        }
        outputLabel.text = String(answer)
    }
    
    func storeInput(inputNumber : inout Double?) {
        guard let inputText = inputTextField.text else {
            print("Invalid input text")
            return
        }
        inputNumber = Double(inputText)
        inputTextField.text?.removeAll()
    }

}

