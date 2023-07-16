//
//  DataStore.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import Foundation
import SwiftUI

public final class DataStore: ObservableObject {

    @Published var goals: [Goal] = SampleGoals.loadSampleGoals("sampleGoals.json")
    
    func loadGoals(completion: @escaping (Result<[Goal], Error>) -> Void = {_ in }) {
        DataStore.load { result in
            switch (result) {
            case .failure(let error):
                fatalError(error.localizedDescription)
            case .success(let goals):
                self.goals = goals
            }
            completion(result)
        }
    }
    
    func saveGoals(completion: @escaping (Result<Int, Error>) -> Void = {_ in }) {
        DataStore.save(goals: self.goals) { result in
            if case.failure(let error) = result {
                fatalError(error.localizedDescription)
            }
            completion(result)
        }
    }
    
    func getBinding(goal: Goal) -> Binding<Goal> {
        return Binding<Goal> {
            return self.goals.first(where: { iterator in iterator.id == goal.id })!
        } set: { newValue in
            let goalIndex = self.goals.firstIndex(where: { iterator in iterator.id == goal.id })!
            self.goals[goalIndex] = newValue
        }
    }
    
    private static func load(completion: @escaping (Result<[Goal], Error>) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async {
            do {

                // If file doesn't exist, just return an empty array
                let fileURL = try fileURL()
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
                let data = try JSONEncoder().encode(goals)
                let fileURL = try fileURL()
                try data.write(to: fileURL)
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
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("goals.data")
    }
}

