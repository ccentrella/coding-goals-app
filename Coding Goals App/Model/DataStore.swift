//
//  DataStore.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import Foundation
import SwiftUI

public final class DataStore: ObservableObject {
    @Published var goals: [Goal] = loadSampleGoals("sampleGoals.json")
    
    func getBinding(goal: Goal) -> Binding<Goal> {
        return Binding<Goal> {
            return self.goals.first(where: { iterator in iterator.id == goal.id })!
        } set: { newValue in
            let goalIndex = self.goals.firstIndex(where: { iterator in iterator.id == goal.id })!
            self.goals[goalIndex] = newValue
        }
    }
    
    func loadGoals() {
        DataStore.load { result in
            switch (result) {
            case .failure(let error):
                fatalError(error.localizedDescription)
            case .success(let goals):
                self.goals = goals
            }
        }
    }
    
    func saveGoals() {
        DataStore.save(goals: self.goals) { result in
            if case.failure(let error) = result {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    private static func load(completion: @escaping (Result<[Goal], Error>) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                let fileURL = try DataStore.fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let goals = try JSONDecoder().decode([Goal].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(goals))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private static func save(goals: [Goal], completion: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                try writeToFile(goals: goals)
                DispatchQueue.main.async {
                    completion(.success(goals.count))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private static func writeToFile(goals: [Goal]) throws {
        let data = try JSONEncoder().encode(goals)
        let fileURL = try fileURL()
        try data.write(to: fileURL)
    }
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("goals.data")
    }
}

func loadSampleGoals<T: Decodable> (_ filename: String) -> T {
    let file: URL = getFile(filename)
    let data: Data = fetchJson(filename, file: file)
    return decodeJson(filename, data: data)
}

private func getFile(_ filename: String) -> URL {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    return file
}
private func fetchJson(_ filename: String, file: URL) -> Data {
    do {
        return try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
}
private func decodeJson<T: Decodable> (_ filename: String, data: Data) -> T {
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
