//
//  URLSession+.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 28.10.2022.
//

import Foundation

extension URLSession {
    enum Errors: Error {
        case invalidURL
        case invalidData
    }

    func response<T: Decodable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = url else {
            completion(.failure(Errors.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(Errors.invalidData))
                }
                return
            }

            data.printJSON()

            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
