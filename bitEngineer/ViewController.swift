//
//  ViewController.swift
//  bitEngineer
//
//  Created by Abdullah Alhomaidhi on 09/10/2020.
//

import UIKit

class ViewController: UIViewController {

    var totalValue: Int = 0
    
    @IBOutlet weak var zerothSlider: UISwitch!
    @IBOutlet weak var firstSlider: UISwitch!
    @IBOutlet weak var secondSlider: UISwitch!
    @IBOutlet weak var thirdSlider: UISwitch!
    @IBOutlet weak var fourthSlider: UISwitch!
    @IBOutlet weak var fifthSlider: UISwitch!
    @IBOutlet weak var sixthSlider: UISwitch!
    @IBOutlet weak var seventhSlider: UISwitch!

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpKeyboard()
        numberLabel.text = String(totalValue)
        numberLabel.layer.masksToBounds = true
        numberLabel.layer.cornerRadius = 5
        zerothSlider.isOn = false
        firstSlider.isOn = false
        secondSlider.isOn = false
        thirdSlider.isOn = false
        fourthSlider.isOn = false
        fifthSlider.isOn = false
        sixthSlider.isOn = false
        seventhSlider.isOn = false
    }
    
    
    
    @IBAction func sliderChanged(_ sender: Any) {
        switch sender as? UISwitch {
        case zerothSlider:
            checkOnOff(slider: zerothSlider, value: 1)
        case firstSlider:
            checkOnOff(slider: firstSlider, value: 2)
        case secondSlider:
            checkOnOff(slider: secondSlider, value: 4)
        case thirdSlider:
            checkOnOff(slider: thirdSlider, value: 8)
        case fourthSlider:
            checkOnOff(slider: fourthSlider, value: 16)
        case fifthSlider:
            checkOnOff(slider: fifthSlider, value: 32)
        case sixthSlider:
            checkOnOff(slider: sixthSlider, value: 64)
        case seventhSlider:
            checkOnOff(slider: seventhSlider, value: 128)
        default:
            print("Error Occurred")
        }
    }

    
    @IBAction func compare(_ sender: Any) {
        compareValues()
    }
    
    func checkOnOff(slider: UISwitch, value: Int){
        if slider.isOn {
            changeToValue(value: value)
        } else {
            changeToValue(value: -value)
        }
    }
    
    func compareValues(){
        if userInput.text == String(totalValue) {
            numberLabel.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            numberLabel.backgroundColor = stackView.backgroundColor
        }
    }
    
    func changeToValue(value: Int) {
        totalValue += value
        numberLabel.text = String(totalValue)
        compareValues()
    }
    
    func setUpKeyboard() {
        let uiToolbar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.size.width, height: 40)))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let selecter = #selector(donePressed)
        
        let doneButtone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: selecter )
        
        uiToolbar.setItems([flexSpace,doneButtone], animated: false)
        
        userInput.inputAccessoryView = uiToolbar
        
    }
    
    @objc func donePressed() {
        userInput.endEditing(true)
    }
}

