//
//  HomeBannerCell.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import UIKit
import Kingfisher

class HomeBannerCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(viewModel: BannerViewModel){
        image.kf.setImage(with: URL(string: viewModel.image))
    }
}
