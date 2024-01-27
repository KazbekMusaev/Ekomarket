//
//  BasketController.swift
//  DagorMarket
//
//  Created by apple on 23.01.2024.
//

import UIKit

final class BasketController: UIViewController {
    
    static let shared = BasketController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Корзина"
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
        
    }
}
