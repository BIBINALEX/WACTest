//
//  HomeProductCell.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import UIKit
import Kingfisher

class HomeProductCell: UICollectionViewCell {
    
    @IBOutlet weak var offer: UIView!
    @IBOutlet weak var express: UIStackView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var favImg: UIImageView!
    @IBOutlet weak var offerPercentage: UILabel!
    @IBOutlet weak var actualPrice: UILabel!
    @IBOutlet weak var sellingPrice: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cartButton: UIView!
    @IBOutlet weak var cartLbl: UILabel!
    var isFav: Bool!{
        didSet{
            self.favImg.tintColor = isFav ? UIColor.red : UIColor(rgb: 0xD6D6D6)
        }
    }
    
    var isInCart: Bool!{
        didSet{
            self.cartLbl.text = isInCart ? "Open Cart" : "Add"
            self.cartButton.backgroundColor = isInCart ? UIColor(rgb: 0x336699) : UIColor(rgb: 0x199B3B)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(viewModel: ProductsViewModel?){
        image.kf.setImage(with: URL(string: viewModel?.image ?? ""))
        offer.isHidden = viewModel?.hideOffer ?? true
        express.isHidden = !(viewModel?.is_express ?? false)
        offerPercentage.text = viewModel?.offer
        name.text = viewModel?.name
        actualPrice.attributedText = NSAttributedString(string: viewModel?.actual_price ?? "")
        actualPrice.strikethrough()
        sellingPrice.text = viewModel?.selling_price
        fetchFav(viewModel: viewModel)
        checkCart(viewModel: viewModel)
        contentView.shadowColor = .gray.withAlphaComponent(0.15)
        contentView.borderColor = .gray.withAlphaComponent(0.3)
        contentView.shadowRadius = 2
        contentView.borderWidth = 1
        contentView.cornerRadius = 4
    }

    @IBAction func togglefav(){
        isFav.toggle()
    }
    
    @IBAction func addtoCart(){
        isInCart = true
    }
    
    func fetchFav(viewModel: ProductsViewModel?){
        isFav = false //check for favourites
    }
    func checkCart(viewModel: ProductsViewModel?){
        isInCart = false //check cart model data for item
    }
}
