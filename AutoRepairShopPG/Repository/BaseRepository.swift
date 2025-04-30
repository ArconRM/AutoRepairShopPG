//
//  BaseRepository.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 26.04.2025.
//

import Foundation
import PostgresClientKit

class BaseRepository<Parser> where Parser: ParserProtocol {
    private let configuration = ConnectionSource.shared.configurationARS
    let parser: Parser
    
    init(parser: Parser) {
        self.parser = parser
    }
    
    func getAllRows(querySource: QuerySources, limit: Int, offset: Int) -> [Parser.Model] {
        var result: [Parser.Model] = []
        do {
            let connection = try Connection(configuration: configuration)
            defer { connection.close() }
            
            let statement = try connection.prepareStatement(text: "SELECT * FROM \(querySource.rawValue) ORDER BY id ASC LIMIT \(limit) OFFSET \(offset);")
            defer { statement.close() }
            
            let cursor = try statement.execute()
            defer { cursor.close() }
            
            for row in cursor {
                let cols = try row.get().columns
                let order = try parser.parse(cols)
                result.append(order)
            }
        } catch {
            print(error)
        }
        return result
    }
    
    func getAllRowsWithCondition(querySource: QuerySources, conditionParams: [String: Any], limit: Int, offset: Int) -> [Parser.Model] {
        var result: [Parser.Model] = []
        do {
            let connection = try Connection(configuration: configuration)
            defer { connection.close() }
            
            let keys = Array(conditionParams.keys)
            let whereClause = keys.enumerated().map { index, key in
                "\(key) = $\(index + 1)"
            }.joined(separator: " AND ")
            
            let query = "SELECT * FROM \(querySource.rawValue) WHERE \(whereClause) ORDER BY id ASC LIMIT \(limit) OFFSET \(offset);"
            let statement = try connection.prepareStatement(text: query)
            defer { statement.close() }
            
            let cursor = try statement.execute(parameterValues: keys.map { conditionParams[$0] as? any PostgresValueConvertible })
            defer { cursor.close() }
            
            for row in cursor {
                let cols = try row.get().columns
                let order = try parser.parse(cols)
                result.append(order)
            }
        } catch {
            print(error)
        }
        return result
    }
    
    func callStoredFunction(querySource: QuerySources, params: [Any], limit: Int, offset: Int) -> [Parser.Model] {
        var result: [Parser.Model] = []
        do {
            let connection = try Connection(configuration: configuration)
            defer { connection.close() }
            
            let placeholders = params.enumerated().map { index, _ in
                "$\(index + 1)"
            }.joined(separator: ", ")

            let query = "SELECT * FROM \(querySource.rawValue)(\(placeholders)) ORDER BY id ASC LIMIT \(limit) OFFSET \(offset);"
            
            let statement = try connection.prepareStatement(text: query)
            defer { statement.close() }
            
            let cursor = try statement.execute(parameterValues: params.map({ $0 as? PostgresValueConvertible }))
            defer { cursor.close() }
            
            for row in cursor {
                let cols = try row.get().columns
                let order = try parser.parse(cols)
                result.append(order)
            }
        } catch {
            print(error)
        }
        return result
    }
}
