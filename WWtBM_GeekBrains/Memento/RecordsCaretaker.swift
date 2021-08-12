//
//  RecordsCaretaker.swift
//  WWtBM_GeekBrains
//
//  Created by Роман Шичкин on 12.08.2021.
//

import Foundation

class RecordsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "key"
    
    func saveRecords(records: [Record]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [Record]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([Record].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
