//
//  ConnectionSource.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import Foundation
import PostgresClientKit

class ConnectionSource {
    static let shared = ConnectionSource()
    private init() {}
    
    var configurationARS: ConnectionConfiguration {
        var configuration = PostgresClientKit.ConnectionConfiguration()
        configuration.host = "localhost"
        configuration.port = 5432
        configuration.database = "AutoRepairShopForTest"
        configuration.user = "postgres"
        configuration.credential = .scramSHA256(password: "123456")
        configuration.ssl = false
        return configuration
    }
}
