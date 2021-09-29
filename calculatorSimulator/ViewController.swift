/**
 * File Name:    ViewController.swift
 * Author:         Quoc Phong Ngo
 * Student ID:   301148406
 * Version:        1.0
 * Date:            September 11th, 2021
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculationsLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var calculationsText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }
    
    private func clearAll()
    {
        calculationsText = ""
        calculationsLabel.text = ""
        resultLabel.text = ""
    }

    @IBAction func OnSpecialButon_Pressed(_ sender: UIButton) {
        let button_text = sender.titleLabel!.text!
        switch button_text
        {
            case "AC":
                clearAll()
                
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
    
    @IBAction func OnOperatorButton_Pressed(_ sender: UIButton) {
        
    }
}

