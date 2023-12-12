//
//  APICaller.swift
//  Good News
//
//  Created by user on 12/12/23.
//

import Foundation


enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case Errordecoding(Error?)
}

class APICaller {
    static let shared = APICaller()
    private init() {}
    
    func fetchNews(url: String, completion: @escaping(Result<[Articles], DataError>)-> Void){
        guard let urlReq = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: urlReq) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return}
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let articleList = try JSONDecoder().decode(ArticleList.self, from: data)
                completion(.success(articleList.articles))
                print(articleList.articles)
            }
            catch {
                completion(.failure(.Errordecoding(error)))
            }
        }.resume()
    }
}
