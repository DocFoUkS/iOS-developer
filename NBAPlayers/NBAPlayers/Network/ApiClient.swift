//
//  ApiClient.swift
//  NBAPlayers
//
//  Created by Aleksandr Anosov on 27.08.2021.
//

import Foundation

enum ApiError: Error {
    case noData
}

protocol ApiClient {
    func getPlayers(completion: @escaping (Result<[Player], Error>) -> Void)
    func getGames(completion: @escaping (Result<[Game], Error>) -> Void)
}

class ApiClientImpl: ApiClient {
    func getPlayers(completion: @escaping (Result<[Player], Error>) -> Void) {
        let session = URLSession.shared

        let url = URL(string: "https://www.balldontlie.io/api/v1/players")!
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in

            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }

            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(PlayersResponse.self, from: data)
                completion(.success(response.data))
            } catch(let error) {
                completion(.failure(error))
            }

        })

        dataTask.resume()
    }
    func getGames(completion: @escaping (Result<[Game], Error>) -> Void) {
        let session = URLSession.shared
        
        let url = URL(string: "https://www.balldontlie.io/api/v1/games?seasons[]=2021")!
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in

            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }

            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(GameResponse.self, from: data)
                completion(.success(response.data))
            } catch(let error) {
                completion(.failure(error))
            }

        })

        dataTask.resume()
    }
}
