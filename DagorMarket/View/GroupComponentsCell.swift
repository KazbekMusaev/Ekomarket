//
//  GroupComponentsCell.swift
//  DagorMarket
//
//  Created by apple on 20.01.2024.
//

import UIKit

final class GroupComponentsCell: UICollectionViewCell {
    static let reuseId = "GroupComponentsCell"
    
        private lazy var imageForComponents: UIImageView = {
            $0.clipsToBounds = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.cornerRadius = 25
            $0.contentMode = .scaleAspectFill
            $0.heightAnchor.constraint(equalToConstant: 50).isActive =  true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            return $0
        }(UIImageView())
        
        private lazy var nameForComponents: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = .boldSystemFont(ofSize: 11)
            $0.textColor = .white
            return $0
        }(UILabel())
        
        private lazy var component: UIView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor(red: 108/255, green: 187/255, blue: 95/255, alpha: 1)
            $0.layer.cornerRadius = 30
            $0.clipsToBounds = true
            $0.addSubview(imageForComponents)
            $0.addSubview(nameForComponents)
            NSLayoutConstraint.activate([
                imageForComponents.topAnchor.constraint(equalTo: $0.topAnchor, constant: 4),
                imageForComponents.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 5),
    
                nameForComponents.topAnchor.constraint(equalTo: imageForComponents.bottomAnchor, constant: 12),
                nameForComponents.centerXAnchor.constraint(equalTo: $0.centerXAnchor),
    
    
            ])
            return $0
        }(UIView())

    func configCell(data: Item){
            self.imageForComponents.image = UIImage(named: data.photo)
            self.nameForComponents.text = data.name
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(component)
        NSLayoutConstraint.activate([
            component.leadingAnchor.constraint(equalTo: leadingAnchor),
            component.trailingAnchor.constraint(equalTo: trailingAnchor),
            component.topAnchor.constraint(equalTo: topAnchor),
            component.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
