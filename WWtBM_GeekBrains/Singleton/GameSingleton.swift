//
//  Game.swift
//  WWtBM_GeekBrains
//
//  Created by Роман Шичкин on 12.08.2021.
//

import Foundation

class GameSingleton {
    
    private let caretaker = RecordsCaretaker()
    static let shared = GameSingleton()
    let gameSession = GameSession()
    
    private(set) var records: [Record] {
        didSet {
            caretaker.saveRecords(records: records)
        }
    }
    
    private init() {
        records = caretaker.loadRecords() ?? []
    }
    
    func addRecord(record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        records.removeAll()
    }
    
}
