//
//  HomeCategoryCell.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import UIKit
import Kingfisher

class HomeCategoryCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var circle: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(viewModel: CatergoryViewModel) {
        self.name.text = viewModel.name
        image.kf.setImage(with: URL(string: viewModel.image))
        DispatchQueue.main.async { [self] in
            circle.cornerRadius = min(circle.frame.height, circle.frame.width)/2
            circle.backgroundColor = UIColor(rgb: [0xFAE7E7, 0xF7F3C9, 0xFCF0F0, 0xFFF2D9].randomElement()!)
        }
    }
}

