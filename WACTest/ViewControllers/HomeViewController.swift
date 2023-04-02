//
//  HomeViewController.swift
//  WACTest
//
//  Created by Bibin Alex on 02/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var tableView: UITableView!
    let viewModel = HomeViewModel()
    let scaleMultiplier = UIDevice.current.userInterfaceIdiom == .phone ? 1: 0.66
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.updateData = {
            self.tableView.reloadData()
        }
        searchView.borderColor = .gray.withAlphaComponent(0.3)
    }
}

//MARK: Tableview Data Source

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        cell.collectionView.tag = indexPath.row
        return cell
    }
}

//MARK: Tableview Delegate

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = self.view.frame.width*scaleMultiplier
        switch viewModel.sectionType(section: indexPath.row) {
        case .category:
            return width*109/375
        case .banner:
            return width*190/375
        case .product:
            return width*290/375
        }
    }
}

//MARK: Collectionview Data Source

extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: collectionView.tag)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let indexPath = IndexPath(item: indexPath.item, section: collectionView.tag)
        let item = viewModel.itemFor(indexPath: indexPath)
        switch viewModel.sectionType(section: collectionView.tag) {
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryCell", for: indexPath) as! HomeCategoryCell
            cell.configureCell(viewModel: CatergoryViewModel(model: item))
            return cell
        case .banner:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCell", for: indexPath) as! HomeBannerCell
            cell.configureCell(viewModel: BannerViewModel(model: item))
            return cell
        case .product:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCell", for: indexPath) as! HomeProductCell
            cell.configureCell(viewModel: ProductsViewModel(model: item))
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch viewModel.sectionType(section: collectionView.tag) {
        case .category:
            return 16
        case .banner:
            return 8
        case .product:
            return 20
        }
    }
}

//MARK: Collectionview Delegate Flow Layout

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width*scaleMultiplier
        switch viewModel.sectionType(section: collectionView.tag) {
        case .category:
            return CGSize(width: width*69/375, height: width*105/375)
        case .banner:
            return CGSize(width: width*330/375, height: width*181/375)
        case .product:
            return CGSize(width: width*158/375, height: width*285/375)
        }
    }
}

//MARK: Collectionview Delegate

extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(collectionView.tag, indexPath.item)
    }
}

//MARK: Textfield Delegate
extension HomeViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(false)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}
