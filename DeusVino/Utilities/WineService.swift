//
//  WineService.swift
//  DeusVino
//
//  Created by Elodie Gage on 09/12/2023.
//

import Foundation

class WineService {
    func fetchWines(for wineType: String, completion: @escaping (Result<WineList, Error>) -> Void) {
        let apiUrl = "https://sampleapis.com/api-list/wines/"
        
        guard let url = URL(string: apiUrl) else {
            let error = NSError(domain: "AppDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "AppDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }

            do {
                let wineList = try JSONDecoder().decode(WineList.self, from: data)
                completion(.success(wineList))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
