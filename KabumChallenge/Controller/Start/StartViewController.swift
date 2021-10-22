//
//  StartViewController.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 18/10/21.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "TopRatedCell"

class StartViewController: UICollectionViewController {
    //MARK: - Properties
    var products: ProdutosResponse?
    var loadingProdutos = false
    var currentPage: Int = 1
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        buscaProdutos()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .backgroundKabum
        collectionView.register(OffersProductsCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .backgroundCell
        ///Retiro o indicador de Scrool Vertical
        collectionView.showsVerticalScrollIndicator = false
    }
}

//MARK: - API
extension StartViewController {
    func buscaProdutos() {
        loadingProdutos = true
        AppService.shared.buscaProdutos { products, err in
            if let err = err {
                print(err)
                return
            }
            if let products = products {
                DispatchQueue.main.async {
                    self.products = products
                    self.loadingProdutos = false
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

//MARK: - UICollectionViewDataSource
extension StartViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.produtos.count ?? .zero
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OffersProductsCell
        cell.addShadowAndBorderAndCorner()
        cell.products = products?.produtos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Utilities().sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Utilities().sectionInsets.left + 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let produtos = products?.produtos.count {
            if indexPath.row == produtos - 1 && !loadingProdutos {
                currentPage += 1
                if produtos > 0 {
                    buscaProdutos()
                }
                print("Loading more produtos")
            }
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension StartViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 10, height: 170)
    }
}
