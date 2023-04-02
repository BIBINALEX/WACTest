//
//  HomeProductCell.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import UIKit

class HomeTableCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(){
        collectionView.reloadData()
    }
}
