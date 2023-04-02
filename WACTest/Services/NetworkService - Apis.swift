//
//  NetworkService - Apis.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import Foundation

extension NetworkServiceProtocol{
    func fetchHomeData() async -> HomeDataModel? {
        if !Connectivity.isConnectedToInternet {
            showSingleAlert(title: "No internet", message: "Connect to internet and try again")
            return nil
        }
        guard let url = URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0") else{
            showSingleAlert(title: "Error", message: "No data found here")
            return nil
        }
        do {
            let data = try await fetchData(url: url, model: HomeDataModel.self)
            return data
        } catch (let error) {
            print("error \(error.localizedDescription)")
            showSingleAlert(title: "Error", message: error.localizedDescription)
        }
        return nil
    }
}
