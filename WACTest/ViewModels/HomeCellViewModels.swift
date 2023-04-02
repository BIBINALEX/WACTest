//
//  HomeBannerViewModel.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import Foundation

struct CatergoryViewModel {
    let image: String
    let name: String
    
    init(model:Values?) {
        self.image = model?.image_url ?? ""
        self.name = model?.name ?? ""
    }
}

struct BannerViewModel {
    let image: String
    
    init(model:Values?) {
        self.image = model?.banner_url ?? ""
    }
}

struct ProductsViewModel {
    let image: String
    let name: String
    let is_express: Bool
    let actual_price: String?
    let selling_price: String?
    let offer: String
    
    var hideOffer: Bool {
        offer == "0% off"
    }
    
    init(model:Values?) {
        self.image = model?.image ?? ""
        self.name = model?.name ?? ""
        self.is_express = model?.is_express ?? true
        self.offer = "\(model?.offer ?? 0)% off"
        self.actual_price = (model?.offer ?? 0) == 0 ? "": model?.actual_price
        self.selling_price =  (model?.offer ?? 0) == 0 ? model?.actual_price: model?.offer_price
    }
}
