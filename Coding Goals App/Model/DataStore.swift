//
//  DataStore.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import Foundation

public final class DataStore: ObservableObject {
    @Published var goals: [Goal] = load("sampleGoals.json")
}

func load<T: Decodable> (_ filename: String) -> T {
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
