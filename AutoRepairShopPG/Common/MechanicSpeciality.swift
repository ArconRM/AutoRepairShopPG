//
//  MechanicSpeciality.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 26.04.2025.
//

import Foundation

enum MechanicSpeciality: Int, Codable, CaseIterable {
    case AutoMechanic = 1
    case AutoElectrician = 2
    case Motorist = 3
    case BodyWorker = 4
    case Painter = 5
    case TireFitter = 6
    
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
