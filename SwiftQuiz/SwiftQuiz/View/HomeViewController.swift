//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Heitor Novais | Gerencianet on 04/05/21.
//

import UIKit

final class HomeViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startQuizTapped(_ sender: Any) {
        self.coordinator?.startQuiz()
    }
}
