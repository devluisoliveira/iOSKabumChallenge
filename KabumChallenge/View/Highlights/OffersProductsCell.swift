//
//  OffersProductsCell.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 16/10/21.
//

import UIKit
import SDWebImage

class OffersProductsCell: UICollectionViewCell {
    
    var products: Produtos? {
        didSet{
            if let products = products {
                productImageView.sd_setImage(with: URL(string: products.img), completed: nil)
                manufacturerLabel.text = products.fabricante.nome
                titleLabel.text = products.nome
                cashValueLabel.text = products.precoDescontoFormatado.currencyInputFormatting()
                installmentAmountLabel.text = "\(products.precoFormatado) em até 12x"
            }
        }
    }
    
    //MARK: - Properties
    ///Imagem produto
    var productImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "product_one")
        iv.setDimension(widht: 180, height: 160)
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 8
        iv.layer.borderWidth = 0.2
        iv.layer.borderColor = UIColor.installmentAmount.cgColor
        return iv
    }()
    
    ///Fabricante
    var manufacturerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "GIGABYTE"
        label.numberOfLines = 1
        label.textColor = .manufacturerProduct
        return label
    }()
    
    ///Title
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Placa de Vídeo Gigabyte NVIDIA Geforce RTX 2060 D6 6G, GDDR6 -"
        label.numberOfLines = 3
        label.textColor = .titleProduct
        return label
    }()
    
    ///Valor do produto a vista
    var cashValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "R$ 3.599.90"
        label.numberOfLines = 1
        label.textColor = .cashValue
        return label
    }()
    
    ///Valor do produto parcelado
    var installmentAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "R$ 4235,18 em até 12x"
        label.numberOfLines = 1
        label.textColor = .installmentAmount
        return label
    }()
    
    ///Botão comprar
    var purchaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Comprar", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .cashValue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    ///Imagem favorites
    lazy var favoriteImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "heart.fill")
        iv.setDimension(widht: 20, height: 20)
        iv.backgroundColor = .backgroundCell
        iv.tintColor = .titleProduct
        return iv
    }()
    
    ///Imagem carrinho de compras
    lazy var shoppingCartImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "cart.fill")
        iv.setDimension(widht: 20, height: 20)
        iv.backgroundColor = .backgroundCell
        iv.tintColor = .titleProduct
        return iv
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundKabum
        addSubview(productImageView)
        addSubview(manufacturerLabel)
        addSubview(titleLabel)
        addSubview(cashValueLabel)
        addSubview(installmentAmountLabel)
        addSubview(purchaseButton)
        addSubview(favoriteImageView)
        addSubview(shoppingCartImageView)
        
        productImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 5, paddingLeft: 5)
        manufacturerLabel.anchor(top: topAnchor, left: productImageView.rightAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        titleLabel.anchor(top: manufacturerLabel.bottomAnchor, left: productImageView.rightAnchor, right: rightAnchor ,paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        cashValueLabel.anchor(top: titleLabel.bottomAnchor, left: productImageView.rightAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        installmentAmountLabel.anchor(top: cashValueLabel.bottomAnchor, left: productImageView.rightAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        purchaseButton.anchor(top: installmentAmountLabel.bottomAnchor, left: productImageView.rightAnchor, right: favoriteImageView.leftAnchor, paddingTop: 15, paddingLeft: 10, paddingBottom: 15, paddingRight: 10, height: 20)
        favoriteImageView.anchor(top: installmentAmountLabel.bottomAnchor, right: shoppingCartImageView.leftAnchor, paddingTop: 15, paddingBottom: 15, paddingRight: 10)
        shoppingCartImageView.anchor(top: installmentAmountLabel.bottomAnchor, left: favoriteImageView.rightAnchor, right: rightAnchor, paddingTop: 15, paddingBottom: 15, paddingRight: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
