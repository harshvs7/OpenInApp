//
//  API Manager.swift
//  OpenInAppProject
//
//  Created by Harshwardhan Sharma on 22/05/23.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<Analytics, DataError>) -> Void

class APIManager {
    static let shared = APIManager()
    
    func callApi(completion: @escaping Handler) {
        guard let url = URL(string:"https://api.inopenapp.com/api/v1/dashboardNew") else{ return }
        let authToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(authToken, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, _,error in
            guard let data = data,error == nil else { return }
            do {
                let response = try JSONDecoder().decode(Analytics.self, from: data)
                completion(.success(response))
                print("success response:\n\(response)")
            }
            catch {
                print("error details", error)
            }
        }
        task.resume()
    }

}
