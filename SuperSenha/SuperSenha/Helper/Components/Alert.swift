//
//  Alert.swift
//  SuperSenha
//
//  Created by Heitor Novais | Gerencianet on 07/05/21.
//

import UIKit

class Alert {
    unowned var delegate: UIViewController?
    
    func showAlert(title: String, message: String) {
        let alertControler = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alertControler.addAction(dismissAction)
        delegate?.present(alertControler, animated: true, completion: nil)
    }
}
