//
//  HomeDataModel.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import Foundation
struct HomeDataModel: Codable {
    let status: Bool?
    let homeData: [HomeData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case homeData = "homeData"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        homeData = try values.decodeIfPresent([HomeData].self, forKey: .homeData)
    }

}
