//
//  Storyboarded.swift
//  UI
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import UIKit

import UIKit

public protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    public static func instantiate() -> Self {
        let vcName = String(describing: self)
        let sbName = vcName.components(separatedBy: "ViewController")[0]
        let bundle = Bundle(for: Self.self)
        let sb = UIStoryboard(name: sbName, bundle: bundle)
        return sb.instantiateViewController(withIdentifier: vcName) as! Self
    }
}
