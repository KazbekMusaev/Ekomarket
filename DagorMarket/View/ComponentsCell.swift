//
//  ComponentsCell.swift
//  DagorMarket
//
//  Created by apple on 20.01.2024.
//

import UIKit

final class ComponentsCell: UICollectionViewCell {
    static let reuseId = "ComponentsCell"
    
    fileprivate let viewManager = AddView()
    
    func configCell(data: Item) {
        self.imageComponent.image = UIImage(named: data.photo)
        self.priceLabel.text = String(data.price)
        self.nameOfComponent.text = data.name
        self.descriptionLabel.text = data.description
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 15
        clipsToBounds = true
        backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        settupCell()
        
    }
    
    private lazy var nameOfComponent: UILabel = {
        let label = self.viewManager.getNameLabelForComponent()
        return label
    }()
    
    private lazy var addToFavoriteBtn: UIView = {
        let favotireView = self.viewManager.getAddToFavoriteBtn(styleEffect: .light)
        return favotireView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = self.viewManager.getDescriptionForComponent()
        return label
    }()
    
    func settupCell() {
        
        addSubview(imageComponent)
        addSubview(price)
        addSubview(rublsLabel)
        addSubview(addToFavoriteBtn)
        addSubview(nameOfComponent)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            imageComponent.topAnchor.constraint(equalTo: topAnchor),
            imageComponent.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageComponent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            price.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            price.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            rublsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            rublsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
        
            addToFavoriteBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addToFavoriteBtn.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            nameOfComponent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameOfComponent.topAnchor.constraint(equalTo: imageComponent.bottomAnchor, constant: 12),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: nameOfComponent.bottomAnchor, constant: 9),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageComponent: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
        $0.heightAnchor.constraint(equalToConstant: 148).isActive = true
        return $0
    }(UIImageView())
    
    private lazy var price: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 14
        $0.heightAnchor.constraint(equalToConstant: 28).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
        $0.backgroundColor = .white
        $0.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.centerXAnchor.constraint(equalTo: $0.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: $0.centerYAnchor),
        ])
        return $0
    }(UIView())
    
    private lazy var priceLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .boldSystemFont(ofSize: 17)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var rublsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "₽"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = UIColor(red: 108/255, green: 187/255, blue: 95/255, alpha: 1)
        return $0
    }(UILabel())
    
    
    
    
    
}
