//
//  TabBarController.swift
//  DagorMarket
//
//  Created by apple on 26.01.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarAppearance()
        let mainVC = UINavigationController(rootViewController: ViewController())
        let basketVC = UINavigationController(rootViewController: BasketController.shared)
        let favoriteVC = FavoriteComponent()
        mainVC.tabBarItem.image = UIImage(systemName: "storefront")
        mainVC.tabBarItem.title = "Главная"
        basketVC.tabBarItem.image = UIImage(systemName: "basket")
        basketVC.tabBarItem.title = "Корзина"
        favoriteVC.tabBarItem.image = UIImage(systemName: "heart.circle.fill")
        favoriteVC.tabBarItem.title = "Избранное"
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .green
        viewControllers = [mainVC, basketVC, favoriteVC]
        
    }
    
    private func setTabBarAppearance() {
        let positionX: CGFloat = 10
        let positionY: CGFloat = 14
        
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(
            x: positionX,
            y: tabBar.bounds.minY - positionY,
            width: width,
            height: height),
                                      cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1).cgColor

        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
    }
    
  
}
