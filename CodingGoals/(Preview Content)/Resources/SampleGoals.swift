//
//  SampleGoals.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 4/19/23.
//

import Foundation

public final class SampleGoals: ObservableObject {
    
    static func loadSampleGoals<T: Decodable> (_ filename: String) -> T {
        let file: URL = getFile(filename)
        let data: Data = fetchJson(filename, file: file)
        return decodeJson(filename, data: data)
    }

    private static func getFile(_ filename: String) -> URL {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        return file
    }
    private static func fetchJson(_ filename: String, file: URL) -> Data {
        do {
            return try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
    }
    private static func decodeJson<T: Decodable> (_ filename: String, data: Data) -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

}
