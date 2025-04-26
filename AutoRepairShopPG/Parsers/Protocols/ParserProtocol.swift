//
//  ParserProtocol.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 26.04.2025.
//

import Foundation
import PostgresClientKit

protocol ParserProtocol {
    associatedtype Model
    func parse(_ cols: [PostgresValue]) throws -> Model
}
