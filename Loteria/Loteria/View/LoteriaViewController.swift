//
//  ViewController.swift
//  Loteria
//
//  Created by Heitor Novais | Gerencianet on 03/05/21.
//

import UIKit

class LoteriaViewController: UIViewController {
    @IBOutlet weak var gameTypeLabel: UILabel!
    @IBOutlet weak var gameTypeSegmentedControl: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!
    
    var currentGameType = GameType.megasena
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gerenateGame()
    }
    
    @IBAction func gerenateGame() {
        let game = currentGameType.generateGame()
        showGame(game)
    }
    
    @IBAction func changeGame(_ sender: Any) {
        currentGameType = GameType(rawValue: gameTypeSegmentedControl.selectedSegmentIndex)!
        gameTypeLabel.text = currentGameType.description
    }
    
    func showGame(_ game: Array<Int>) {
        switch currentGameType {
        case .megasena:
            balls.last?.isHidden = false
        default:
            balls.last?.isHidden = true
        }
        for (index, number) in game.enumerated() {
            balls[index].setTitle(number.description, for: .normal)
        }
    }
}

