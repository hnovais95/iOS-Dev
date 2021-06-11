//
//  ViewController.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 06/05/21.
//

import UIKit

class ShowPasswordsViewController: UIViewController, Storyboarded {
    @IBOutlet weak var passwordsTextView: UITextView!
    
    var coordinator: MainCoordinator?
    var passwordGeneratorViewModel: PasswordGeneratorViewModel?
    var setupNavBar: (() -> Void)?
    weak var delegate: RulesDelegate?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePassword()
    }

    @IBAction func generatePasswordAgainTapped(_ sender: UIButton) {
        generatePassword()
    }
    
    @IBAction func showSafetyTips(_ sender: UIButton) {
        coordinator?.showSafetyTips()
    }
    
    func generatePassword() {
        guard let (numberPasswords, rules) = delegate?.getRules() else { return }
        var passwords = [String]()
        while passwords.count < numberPasswords {
            if let password = passwordGeneratorViewModel?.generatePassword(rules: rules){
                passwords.append(password)
            }
        }
        showPasswords(passwords)
    }
    
    func showPasswords(_ passwords: [String]) {
        passwordsTextView.scrollRangeToVisible(NSRange(location: 0, length: 0))
        passwordsTextView.text = ""
        for password in passwords {
            passwordsTextView.text.append(password + "\n\n")
        }
    }
}

