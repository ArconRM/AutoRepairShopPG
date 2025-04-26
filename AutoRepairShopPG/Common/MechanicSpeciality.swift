//
//  MechanicSpeciality.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 26.04.2025.
//

import Foundation

enum MechanicSpeciality: Int, Codable {
    case AutoMechanic
    case AutoElectrician
    case Motorist
    case BodyWorker
    case Painter
    case TireFitter
    
    var name: String {
        switch self {
        case .AutoMechanic:
            return "Автомеханик"
        case .AutoElectrician:
            return "Автоэлектрик"
        case .Motorist:
            return "Моторист"
        case .BodyWorker:
            return "Кузовщик"
        case .Painter:
            return "Маляр"
        case .TireFitter:
            return "Шиномонтажник"
        }
    }
}
