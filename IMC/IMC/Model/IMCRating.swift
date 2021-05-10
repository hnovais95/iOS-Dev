//
//  IMC.swift
//  IMC
//
//  Created by Heitor Novais | Gerencianet on 10/05/21.
//

import Foundation

protocol IMCRating {
    var description: String { get }
    var imageName: String { get }
}

struct Magreza: IMCRating {
    var description = "Magreza"
    var imageName = "magreza"
}

struct AbaixoDoPeso: IMCRating {
    var description = "Abaixo do peso"
    var imageName = "abaixo"
}

struct PesoIdeal: IMCRating  {
    var description = "Peso ideal"
    var imageName = "ideal"
}

struct Sobrepeso: IMCRating  {
    var description = "Sobrepeso"
    var imageName = "sobre"
}

struct Obesidade: IMCRating  {
    var description = "Obesidade"
    var imageName = "obesidade"
}
