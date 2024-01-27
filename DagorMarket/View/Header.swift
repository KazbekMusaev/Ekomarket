//
//  Header.swift
//  DagorMarket
//
//  Created by apple on 21.01.2024.
//

import UIKit

class Header: UICollectionReusableView {
    
    static let reuseId = "Header"
    
    var delegate: HeaderDelegate?
    
    private lazy var labelFeatured : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 18)
        $0.text = "Рекомендуемые товары"
        return $0
    }(UILabel())
    
    private lazy var btnSeeAll: UIButton = {
        $0.setTitle("Все >", for: .normal)
        $0.setTitleColor(UIColor(red: 108/255, green: 187/255, blue: 95/255, alpha: 1), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: btnSeeAllAction))
    
    private lazy var btnSeeAllAction = UIAction { _ in
        self.delegate?.didTupToAllBtn()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labelFeatured)
        addSubview(btnSeeAll)
        
        NSLayoutConstraint.activate([
            labelFeatured.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelFeatured.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            btnSeeAll.centerYAnchor.constraint(equalTo: centerYAnchor),
            btnSeeAll.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Header: UINavigationControllerDelegate {
    
}
