//
//  ButtonState.swift
//  Conversores
//
//  Created by Heitor Novais | Gerencianet on 10/05/21.
//

import UIKit

struct AssociatedKeys {
    static var toggleState: UInt8 = 0
}

protocol ToggleProtocol {
    func toggle()
}

enum ToggleState {
    case on
    case off
}

extension UIButton: ToggleProtocol {
    private(set) var toggleState: ToggleState {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.toggleState) as? ToggleState else { return .off }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self,
                                     &AssociatedKeys.toggleState,
                                     newValue,
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func toggle() {
        if toggleState == .off {
            setToggleStateToOn()
        } else {
            setToggleStateToOff()
        }
    }
    
    func setToggleStateToOn() {
        toggleState = .on
        alpha = 1
    }
    
    func setToggleStateToOff() {
        toggleState = .off
        alpha = 0.5
    }
}
