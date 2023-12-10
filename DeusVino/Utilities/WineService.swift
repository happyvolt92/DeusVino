// WineService.swift

import Foundation

class WineService {
    func fetchWines(for wineName: String, wineType: String?, minPrice: Double?, maxPrice: Double?, completion: @escaping (Result<[Wine], Error>) -> Void) {
        // Construct the Vivino API URL using the provided parameters
        let apiUrl = "https://api.example.com/vivino"
        
        // Create URL components and add query parameters
        var components = URLComponents(string: apiUrl)!
        components.queryItems = [
            URLQueryItem(name: "name", value: wineName),
            URLQueryItem(name: "minPrice", value: minPrice.map { String($0) }),
            URLQueryItem(name: "maxPrice", value: maxPrice.map { String($0) }),
            URLQueryItem(name: "wineType", value: wineType)
        ]

        // Validate the URL
        guard let url = components.url else {
            let error = NSError(domain: "AppDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }

        // Perform a data task to fetch data from the URL
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for any errors during the data task
            if let error = error {
                completion(.failure(error))
                return
            }

            // Ensure that data is received
            guard let data = data else {
                let error = NSError(domain: "AppDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }

            do {
                // Parse the JSON data into an array of Wine models
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(WineResponse.self, from: data)
                completion(.success(result.vinos))
            } catch {
                // Handle JSON decoding errors
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
