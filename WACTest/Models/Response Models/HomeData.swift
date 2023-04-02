//
//  HomeData.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import Foundation

struct HomeData: Codable {
    let type: String?
    let values: [Values]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case values = "values"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        self.values = try values.decodeIfPresent([Values].self, forKey: .values)
    }

}
