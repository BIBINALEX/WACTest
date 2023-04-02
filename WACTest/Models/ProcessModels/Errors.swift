//
//  Errors.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var code: Int
    var status: String
    var localizedDescription: String
}
