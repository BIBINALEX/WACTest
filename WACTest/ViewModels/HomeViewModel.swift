//
//  HomeViewModel.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import Foundation
class HomeViewModel: ObservableObject {
    var updateData: (() -> Void) = { }
    private(set) var homeData: HomeDataModel?{
        didSet{
            DispatchQueue.main.async {
                self.updateData()
            }
        }
    }
    
    init() {
        self.fetchHomeData()
    }
    
    fileprivate func fetchHomeData() {
        Task.init {
            self.homeData = await NetworkService.shared.fetchHomeData()
        }
    }
    
    func sectionType(section:Int) -> SectionType{
        SectionType(rawValue: self.homeData?.homeData?[section].type ?? "") ?? .category
    }
    
    func numberOfSections() -> Int {
        self.homeData?.homeData?.count ?? 0    }
    
    func numberOfItemsInSection(section:Int) -> Int {
        homeData?.homeData?[section].values?.count ?? 0
    }
    
    func itemFor(indexPath:IndexPath) -> Values? {
        homeData?.homeData?[indexPath.section].values?[indexPath.item]
    }
}

enum SectionType: String {
    case category = "category"
    case banner = "banners"
    case product = "products"
}
