//
//  NetworkService.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func fetchData<T:Codable>(url:URL,model:T.Type) async throws -> T
}

class NetworkService {
    static let shared: NetworkServiceProtocol = NetworkService()
    private init() { }
}

extension NetworkService: NetworkServiceProtocol {
    func fetchData<T:Codable>(url:URL,model:T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation({ continuation in
            AF.request(url,method: .get).responseDecodable { (response: DataResponse<T,AFError>)  in
                print(response)
                switch response.result {
                case .success(let result):
                    continuation.resume(returning: result)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
