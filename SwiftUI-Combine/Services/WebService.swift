//
//  WebService.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation

class WebService {
    
    func makeRequest<D: Decodable, E: Encodable>(with parameters: E, and function: String, completion: @escaping(Result<D>) -> Void) {
        
        var queryString = ""
        do {
            let jsonEncoder = JSONEncoder()
            let body = try jsonEncoder.encode(parameters.self)
            if let dicParam = try? JSONSerialization.jsonObject(with: body, options: []) as? [String: Any] {
                for (key, value) in dicParam {
                    queryString.append(queryString.isEmpty ? "?": "&")
                    queryString.append("\(key)=\(value)")
                }
            }
            
        } catch {
            completion(.failure(ServiceError.domainError(description: error.localizedDescription, errorCode: 500)))
        }
        
        // URL
        let urlString = "https://gateway.marvel.com/\(function)\(queryString)".trimmingCharacters(in: .whitespacesAndNewlines)
        guard let finalUrl = URL(string: urlString) else {
            let description = "Invalid URL"
            DispatchQueue.main.async(execute: {
                completion(.failure(ServiceError.domainError(description: description, errorCode: 503)))
            })
            return
        }
        
        // Make request
        var theRequest = URLRequest(url: finalUrl)
        theRequest.timeoutInterval = 60.0
        theRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        theRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: theRequest) { (data, response, error) in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(ServiceError.invalidResponse))
                }
                return
            }
            
            let decodedResult: Result<D> = self.decodeData(data: data)
            DispatchQueue.main.async {
                completion(decodedResult)
            }
        }.resume()
    }
}

private extension WebService {
    
    func decodeData<D: Decodable>(data: Data) -> Result<D> {
        do {
            let decoded = try JSONDecoder().decode(D.self, from: data)
            return .success(decoded)
        } catch(let error) {
            print(error.localizedDescription)
            return .failure(ServiceError.invalidJSON)
        }
    }
    
}
