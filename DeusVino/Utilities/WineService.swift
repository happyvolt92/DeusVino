// WineService.swift
// WineService.swift

import Foundation

class WineService {
    // Function to fetch wines from the Vivino API based on wine name
    func fetchWines(for wineName: String, completion: @escaping (Result<[Wine], Error>) -> Void) {
        // Construct the Vivino API URL using the provided parameters
        let apiUrl = "https://api.example.com/vivino"
        
        // Create URL components and add query parameters
        var components = URLComponents(string: apiUrl)!
        components.queryItems = [
            URLQueryItem(name: "name", value: wineName)
        ]

        // Validate the URL
        guard let url = components.url else {
            // If URL is invalid, return an error
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

            // Print the received data for debugging
            print("Received Data: \(String(data: data, encoding: .utf8) ?? "Data is not valid UTF-8")")

            // Print the HTTP status code for debugging purposes
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
            }

            do {
                // Parse the JSON data into an array of Wine models
                let wines = try JSONDecoder().decode([Wine].self, from: data)
                completion(.success(wines))
            } catch {
                // Handle JSON decoding errors
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
