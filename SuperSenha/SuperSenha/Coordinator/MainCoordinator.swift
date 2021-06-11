//
//  MainCoordinator.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 05/05/21.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = PasswordGeneratorViewController.instantiate()
        vc.coordinator = self
        vc.setupNavBar = {[unowned self] in
            self.navigationController.navigationBar.barTintColor = UIColor.secondarySystemBackground
        }
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPasswords(delegate: PasswordGeneratorViewController) {
        let vc = ShowPasswordsViewController.instantiate()
        vc.coordinator = self        
        vc.passwordGeneratorViewModel = PasswordGeneratorViewModel()
        vc.delegate = delegate        
        vc.setupNavBar = {[unowned self] in
            self.navigationController.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Gerador de senhas", style: .plain, target: nil, action: nil)
            self.navigationController.navigationBar.topItem?.backBarButtonItem?.tintColor = UIColor(red: 155/255.0, green: 36/255.0, blue: 101/255.0, alpha: 1)       
            self.navigationController.navigationBar.barTintColor = UIColor(red: 238/255.0, green: 179/255.0, blue: 217/255.0, alpha: 1)
        }
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSafetyTips() {
        let vc = SafetyTipsViewController.instantiate()
        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    func dismissModal(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        /*if let originOfSomeChildCoordinatorViewController = fromViewController as? SomeViewController {
            childDidFinish(originOfSomeChildCoordinatorViewController.coordinator)
        }*/
    }
}
