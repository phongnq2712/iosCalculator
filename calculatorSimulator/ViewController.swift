/**
 * File Name:    ViewController.swift
 * Author:         Quoc Phong Ngo
 * Student ID:   301148406
 * Version:        2.0
 * Date Modified:   September 30th, 2021
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculationsLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var calculationsText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // clear all labels
        clearAll()
    }
    
    private func clearAll()
    {
        calculationsText = ""
        calculationsLabel.text = ""
        resultLabel.text = ""
    }
    
    private func backSpace()
    {
        if(!calculationsText.isEmpty)
        {
            calculationsText.removeLast()
            calculationsLabel.text = calculationsText
        }
    }

    @IBAction func OnSpecialButon_Pressed(_ sender: UIButton) {
        let button_text = sender.titleLabel!.text!
        switch button_text
        {
        case "AC":
            clearAll()
        case "<":
            backSpace()
            
        default:
            calculationsText.append(button_text)
                
        }
        calculationsLabel.text = calculationsText
    }
    
    @IBAction func OnNumerButton_Pressed(_ sender: UIButton) {
        let button_text = sender.titleLabel!.text!
        switch button_text
        {
        case ".":
            if(!calculationsText.contains("."))
            {
                calculationsText.append(button_text)
            }
        case "0":
            if(calculationsText != "0")
            {
                calculationsText.append(button_text)
            }
        case "1":
            if(calculationsText.prefix(1) == "0" && calculationsText.prefix(2) != "0.")
            {
                // remove "0" at first. Ex: "01" -> "1"
                calculationsText = ""
            }
            calculationsText.append(button_text)
        case "2":
            if(calculationsText.prefix(1) == "0" && calculationsText.prefix(2) != "0.")
            {
                // remove "0" at first. Ex: "02" -> "2"
                calculationsText = ""
            }
            calculationsText.append(button_text)
        case "3":
            if(calculationsText.prefix(1) == "0" && calculationsText.prefix(2) != "0.")
            {
                // remove "0" at first. Ex: "03" -> "3"
                calculationsText = ""
            }
            calculationsText.append(button_text)
        case "4":
            if(calculationsText.prefix(1) == "0" && calculationsText.prefix(2) != "0.")
            {
                // remove "0" at first. Ex: "04" -> "4"
                calculationsText = ""
            }
            calculationsText.append(button_text)
        case "5":
            if(calculationsText.prefix(1) == "0" && calculationsText.prefix(2) != "0.")
            {
                // remove "0" at first. Ex: "05" -> "5"
                calculationsText = ""
            }
            calculationsText.append(button_text)
        case "6":
            if(calculationsText.prefix(1) == "0" && calculationsText.prefix(2) != "0.")
            {
                // remove "0" at first. Ex: "06" -> "6"
                calculationsText = ""
            }
            calculationsText.append(button_text)
        case "7":
            if(calculationsText.prefix(1) == "0" && calculationsText.prefix(2) != "0.")
            {
                // remove "0" at first. Ex: "07" -> "7"
                calculationsText = ""
            }
            calculationsText.append(button_text)
        case "8":
            if(calculationsText.prefix(1) == "0" && calculationsText.prefix(2) != "0.")
            {
                // remove "0" at first. Ex: "08" -> "8"
                calculationsText = ""
            }
            calculationsText.append(button_text)
        case "9":
            if(calculationsText.prefix(1) == "0" && calculationsText.prefix(2) != "0.")
            {
                // remove "0" at first. Ex: "09" -> "9"
                calculationsText = ""
            }
            calculationsText.append(button_text)
            
        default:
            calculationsText.append(button_text)
                
        }
        calculationsLabel.text = calculationsText
    }
    
    func matchesRegex(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex,options:.caseInsensitive)
            let results = regex.matches(in: text,
                                        range: NSRange(location: 0, length: text.count))
            let finalResult = results.map {
                (text as NSString).substring(with: $0.range)
            }
            
            return finalResult
        } catch let error {
            print("error regex: \(error.localizedDescription)")
            
            return []
        }
    }
    
    /**
     *   compound calculation in a series
     */
    private func calculate() -> Double
    {
        // create a pattern for complex calculation
        let allMatches = matchesRegex(for: "([-|+|x|/]?[0-9]+)", in: calculationsText)
        // loop array of match
        // Example: 1+3-2 -> ["1","+3","-2"]
        var total = 0.0
        for match in allMatches
        {
            switch match.prefix(1) {
            case "+":
                total += Double(String(match.dropFirst()))!
            case "-":
                total += Double(String(match))!
            default:
                total += Double(match)!
            }
        }
      
        return total
    }
    
    @IBAction func OnOperatorButton_Pressed(_ sender: UIButton) {
        let button_text = sender.titleLabel!.text!
        switch button_text
        {
        case "+":
            if(calculationsText.suffix(1) != "+")
            {
                calculationsText.append(button_text)
            }
            calculationsLabel.text = calculationsText
        case "-":
            if(calculationsText.suffix(1) != "-")
            {
                calculationsText.append(button_text)
            }
            calculationsLabel.text = calculationsText
        case "x":
            if(calculationsText.suffix(1) != "x")
            {
                calculationsText.append(button_text)
            }
            calculationsLabel.text = calculationsText
        case "/":
            if(calculationsText.suffix(1) != "/")
            {
                calculationsText.append(button_text)
            }
            calculationsLabel.text = calculationsText
        case "=":
            print("----------------")
            print(calculationsText)
            let result = calculate()
            resultLabel.text = "\(result)"
        default:
            break;
        }
    }
}

