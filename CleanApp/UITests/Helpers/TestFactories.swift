//
//  TestFactories.swift
//  UITests
//
//  Created by Heitor Novais | Gerencianet on 16/06/21.
//

import UIKit

extension UIControl {
    
    func simulate(event: UIControl.Event) {
        self.allTargets.forEach { target in
            self.actions(forTarget: target, forControlEvent: event)?.forEach { action in
                (target as NSObject).perform(Selector(action))
            }
        }
    }
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
