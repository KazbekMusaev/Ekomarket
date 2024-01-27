//
//  ComponentView.swift
//  DagorMarket
//
//  Created by apple on 21.01.2024.
//

import UIKit

final class ComponentView: UIViewController {
    
    func configComponentView(data: Item){
        self.imageProduct.image = UIImage(named: data.photo)
        self.productaName.text = data.name
        self.productDescription.text = data.description
    }

    private lazy var addToBasket: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 64).isActive = true
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(red: 51/255, green: 202/255, blue: 26/255, alpha: 1)
        
        $0.addSubview(basketImage)
        $0.addSubview(orderNowLabel)
        
        NSLayoutConstraint.activate([
            basketImage.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 15),
            basketImage.centerYAnchor.constraint(equalTo: $0.centerYAnchor),
            
            orderNowLabel.leadingAnchor.constraint(equalTo: basketImage.trailingAnchor, constant: 10),
            orderNowLabel.centerYAnchor.constraint(equalTo: $0.centerYAnchor),
            
        ])
        
        return $0
    }(UIView())
    
    private lazy var priceLabel: UILabel = {
        return $0
    }(UILabel())
    
    private lazy var orderNowLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Добавить в корзину"
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var basketImage: UIImageView = {
        $0.contentMode = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .white
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        $0.layer.cornerRadius = 8
        $0.heightAnchor.constraint(equalToConstant: 36).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 36).isActive = true
        return $0
    }(UIImageView(image: UIImage(systemName: "basket.fill")))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 226/255, green: 242/255, blue: 224/255, alpha: 1)
        settupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
    private lazy var contentView: UIView = {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        $0.addSubview(productaName)
        $0.addSubview(desctiprionLabel)
        $0.addSubview(productDescription)
        
        NSLayoutConstraint.activate([
            productaName.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 30),
            productaName.topAnchor.constraint(equalTo: $0.topAnchor, constant: 30),
            
            desctiprionLabel.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 30),
            desctiprionLabel.topAnchor.constraint(equalTo: productaName.bottomAnchor, constant: 35),
                        
            productDescription.topAnchor.constraint(equalTo: desctiprionLabel.bottomAnchor, constant: 8),
            productDescription.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 30),
            productDescription.trailingAnchor.constraint(equalTo: $0.trailingAnchor,constant: -30),
            productDescription.bottomAnchor.constraint(equalTo: $0.bottomAnchor,constant: -110),
        ])
        
        return $0
    }(UIView())
    
    private lazy var productDetails: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alwaysBounceVertical = true
        $0.bounces = false
        $0.contentInsetAdjustmentBehavior = .never
        $0.showsVerticalScrollIndicator = false
        
        
        $0.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: $0.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: $0.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: $0.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: $0.widthAnchor),
        ])
        return $0
    }(UIScrollView())
    
    private lazy var imageProduct: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.heightAnchor.constraint(equalToConstant: 350).isActive = true
        return $0
    }(UIImageView())
    
    private lazy var desctiprionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Описание"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 16)
        return $0
    }(UILabel())
    
    private lazy var productDescription: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.textColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var goToBasketBtn: UIButton = {
        $0.setBackgroundImage(UIImage(systemName: "basket"), for: .normal)
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return $0
    }(UIButton(primaryAction: goToBasketAction))
    
    private lazy var goToBasketAction = UIAction { [weak self] _ in
        guard let self = self else { return }
        self.tabBarController?.selectedIndex = 1
    }
    
    private lazy var productaName: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var btnBack: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addGestureRecognizer(tapToBackBtn)
        $0.tintColor = .white
        $0.isUserInteractionEnabled = true
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return $0
    }(UIImageView(image: UIImage(systemName: "arrow.backward.square")))
    
    private lazy var tapToBackBtn: UITapGestureRecognizer = {
        $0.addTarget(self, action: #selector(actionForTapToBack(sender:)))
        return $0
    }(UITapGestureRecognizer())
    
    @objc
    func actionForTapToBack(sender: UITapGestureRecognizer){
        UIView.animate(withDuration: 0.5) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func settupView() {
        
        view.addSubview(btnBack)
        view.addSubview(imageProduct)
        view.addSubview(productDetails)
        view.addSubview(goToBasketBtn)
        
        view.addSubview(addToBasket)
        
        NSLayoutConstraint.activate([
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            goToBasketBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            goToBasketBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            imageProduct.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageProduct.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            imageProduct.topAnchor.constraint(equalTo: btnBack.bottomAnchor, constant: 27),
            
            productDetails.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productDetails.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productDetails.topAnchor.constraint(equalTo: imageProduct.bottomAnchor),
            productDetails.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addToBasket.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            addToBasket.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            addToBasket.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
        ])
        
    }
    
    
}
