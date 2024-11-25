//
//  ViewController.swift
//  CPSC411_ColorMaker
//
//  Created by Mariah Salgado on 10/28/24.
//

import UIKit

class ViewController: UIViewController {

    // Color display
    @IBOutlet weak var colorDisplayView: UIView!
    
    // Red controls
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var movingRed: UISlider!
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var redSwitchPressed: UISwitch!
    
    // Green controls
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var movingGreen: UISlider!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var greenSwitch: UISwitch!
    
    @IBOutlet weak var greenSwitchPressed: UISwitch!
    // Blue controls
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var movingBlue: UISlider!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var blueSwitchPressed: UISwitch!
    
    // Reset button
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var resetButtonSelected: UIButton!
    // Color intensity values
    private var redIntensity: Float = 1.0
    private var greenIntensity: Float = 1.0
    private var blueIntensity: Float = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialValues()
    }

    private func setupInitialValues() {
        // Initialize sliders and text fields
        redSlider.value = redIntensity
        greenSlider.value = greenIntensity
        blueSlider.value = blueIntensity

        updateTextFields()
        updateColorDisplay()
    }

    private func updateTextFields() {
        // Update text fields to match slider values
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }

    private func updateColorDisplay() {
        let red = redSwitch.isOn ? CGFloat(redSlider.value) : 0
        let green = greenSwitch.isOn ? CGFloat(greenSlider.value) : 0
        let blue = blueSwitch.isOn ? CGFloat(blueSlider.value) : 0
        colorDisplayView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    @IBAction func movingRed(_ sender: UISlider) {
        redIntensity = sender.value
        updateTextFields()
        updateColorDisplay()
    }

    @IBAction func movingGreen(_ sender: UISlider) {
        greenIntensity = sender.value
        updateTextFields()
        updateColorDisplay()
    }

    @IBAction func movingBlue(_ sender: UISlider) {
        blueIntensity = sender.value
        updateTextFields()
        updateColorDisplay()
    }

    @IBAction func redSwitchPressed(_ sender: UISwitch) {
        redSlider.isEnabled = sender.isOn
        redTextField.isEnabled = sender.isOn
        updateColorDisplay()
    }

    @IBAction func greenSwitchPressed(_ sender: UISwitch) {
        greenSlider.isEnabled = sender.isOn
        greenTextField.isEnabled = sender.isOn
        updateColorDisplay()
    }

    @IBAction func blueSwitchPressed(_ sender: UISwitch) {
        blueSlider.isEnabled = sender.isOn
        blueTextField.isEnabled = sender.isOn
        updateColorDisplay()
    }

    @IBAction func resetButtonSelected(_ sender: UIButton) {
        redSwitch.isOn = true
        greenSwitch.isOn = true
        blueSwitch.isOn = true
        setupInitialValues()
    }
}
