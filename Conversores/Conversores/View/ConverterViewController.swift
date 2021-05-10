//
//  ViewController.swift
//  Converters
//
//  Created by Heitor Novais | Gerencianet on 01/05/21.
//

import UIKit

class ConverterViewController: UIViewController {
    @IBOutlet weak var measureLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var nextMeasureButton: UIButton!
    @IBOutlet weak var firstUnitButton: UIButton!
    @IBOutlet weak var secondUnitButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var outputUnitLabel: UILabel!
    
    let viewModel = ConverterViewModel()
    let formatter = Formatter(identifier: NSLocale.current.regionCode!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstUnitButton.setToggleStateToOn()
        secondUnitButton.setToggleStateToOff()
        
        inputTextField.addTarget(self, action: #selector(inputValueTextFieldEditingDidBegin(_:)), for: .editingDidBegin)
        inputTextField.addTarget(self, action: #selector(inputValueTextFieldEditingChanged(_:)), for: .editingChanged)
        nextMeasureButton.addTarget(self, action: #selector(handleNextMeasureButtonAction(_:)), for: .touchUpInside)
        firstUnitButton.addTarget(self, action: #selector(handleChooseUnitButtonAction(_:)), for: .touchUpInside)
        secondUnitButton.addTarget(self, action: #selector(handleChooseUnitButtonAction(_:)), for: .touchUpInside)
        
        setupMeasure()
        convert()
    }
    
    @objc
    func handleNextMeasureButtonAction(_ sender: UIButton) {
        viewModel.nextMeasure()
        setupMeasure()
        convert()
    }
    
    @objc
    func handleChooseUnitButtonAction(_ sender: UIButton) {
        firstUnitButton.toggle()
        secondUnitButton.toggle()
        updateUnits(buttonTapped: sender)
        convert()
        view.endEditing(true)
    }
    
    @objc
    func inputValueTextFieldEditingDidBegin(_ sender: Any) {
        inputTextField.text = ""
    }
    
    @objc
    func inputValueTextFieldEditingChanged(_ sender: Any) {
        guard let value = inputTextField.text else { return }
        viewModel.value = formatter.toDouble(value)
        convert()
    }
    
    func setupMeasure() {
        let (firstUnit, secondUnit) = viewModel.getUnits()
        measureLabel.text = viewModel.currentMeasure.description
        firstUnitButton.setTitle(firstUnit, for: .normal)
        secondUnitButton.setTitle(secondUnit, for: .normal)
    }
    
    func updateUnits(buttonTapped: UIButton) {
        if buttonTapped == firstUnitButton {
            viewModel.inputUnitRawValue = 0
            viewModel.outputUnitRawValue = 1
        } else {
            viewModel.inputUnitRawValue = 1
            viewModel.outputUnitRawValue = 0
        }
    }
    
    func convert() {
        if let result = viewModel.getConvertedValue() {
            showResult(result)
        }
    }
    
    func showResult(_ result: Double)
    {
        resultLabel.text = formatter.toString(value: result, decimalPlaces: 2) // define the decimal separator according to the region
        outputUnitLabel.text = firstUnitButton.toggleState == .off ? firstUnitButton.currentTitle : secondUnitButton.currentTitle
        resultLabel.isHidden = false
        outputUnitLabel.isHidden = false
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !viewModel.isValidInput(inputTextField.text) {
            showAlert(title: "Campo inválido", message: "Preencha o campo corretamente")
        } else {
            view.endEditing(true)
        }
    }
}

