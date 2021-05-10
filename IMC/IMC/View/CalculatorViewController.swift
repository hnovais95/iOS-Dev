//
//  ViewController.swift
//  IMC
//
//  Created by Heitor Novais on 30/04/21.
//

import UIKit

final class CalculatorViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultTextField: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultImageView: UIImageView!
    
    let viewModel = CalculatorViewModel()
    let formatter = Formatter(identifier: NSLocale.current.regionCode!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightTextField.addTarget(self, action: #selector(weightChanged), for: .editingChanged)
        heightTextField.addTarget(self, action: #selector(heightChanged), for: .editingChanged)
    }
    
    @objc
    func weightChanged() {
        guard let weight = weightTextField.text else { return }
        viewModel.weight = formatter.toDouble(weight)
    }
    
    @objc
    func heightChanged() {
        guard let height = heightTextField.text else { return }
        viewModel.height = formatter.toDouble(height)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    } 

    @IBAction func calculate(_ sender: Any) {
        if let imc = viewModel.calculateIMC() {
            showResult(imc)
        }
    }
    
    func showResult(_ imc: Double) {
        let rating = viewModel.getRating(by: imc)
        guard let imc = formatter.toString(value: imc, decimalPlaces: 2) else { return } // define the decimal separator according to the region
        resultTextField.text = "\(imc): \(rating.description)"
        resultImageView.image = UIImage(named: rating.imageName)
        resultView.isHidden = false
        view.endEditing(true)
    }
}
