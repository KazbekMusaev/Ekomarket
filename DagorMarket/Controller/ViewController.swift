//
//  ViewController.swift
//  DagorMarket
//
//  Created by apple on 20.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let modelData = ModelData.getData()
    
    private let userData = UserData.getData()

    private let viewManager = AddView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "DAGOR"
        view.backgroundColor = UIColor(red: 30/255, green: 71/255, blue: 37/255, alpha: 1)
        setupViewsInViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: Коллекция
    private lazy var collection: UICollectionView = {
        $0.register(GroupComponentsCell.self, forCellWithReuseIdentifier: GroupComponentsCell.reuseId)
        $0.register(ComponentsCell.self, forCellWithReuseIdentifier: ComponentsCell.reuseId)
        $0.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.reuseId)
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: createLayout()))
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:
                return self.getComponentGroup()
            default:
                return self.getComponents()
            }
        }
    }
    
    func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 26)
        return layoutSectionHeader
    }
    
    private func getComponentGroup() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 14)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(74), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 26, bottom: 20, trailing: 0)
        return section
    }
    
    private func getComponents() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 14, trailing: 14)
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(174), heightDimension: .estimated(230))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item, item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 26, bottom: 0, trailing: 0)
        let header = createHeader()
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    
    
    // MARK: Элементы View
    private lazy var blurEffect: UIVisualEffectView = {
        let blur = self.viewManager.getBlurEffect()
        blur.addGestureRecognizer(tapGestureHiddenShowMenu)
        return blur
    }()
    
    private lazy var mainView: UIView = {
        let view = self.viewManager.getMainView(frame: self.view.frame)
        return view
    }()
    
    private lazy var menuUser: UIView = {
        let menu = self.viewManager.getMenuView(userName: userData.name, userPhoto: userData.photo, userMailText: userData.email, actionForMyOrderBtn: actionForMyOrderbtn, actionForMyProfileBtn: actionForMyProfileBtn, actionForMyAddressBtn: actionFotMyAddressBtn, actionForContactUsBtn: actionForContactUsBtn, actionForSettingBtn: actionForSettingBtn, actionForExitBtn: actionForExitBtn)
        menu.frame = CGRect(x: -(self.view.frame.width / 2), y: 0, width: 0, height: 0)
        return menu
    }()
    
    private lazy var btnShowMenu: UIView = {
        $0.addGestureRecognizer(tapGestureShowMenu)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
        $0.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        $0.layer.cornerRadius = 12
        let firstLine = UIView()
        firstLine.translatesAutoresizingMaskIntoConstraints = false
        firstLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        firstLine.widthAnchor.constraint(equalToConstant: 14).isActive = true
        firstLine.backgroundColor = .black
        firstLine.layer.cornerRadius = 1
        let secondLine = UIView()
        secondLine.translatesAutoresizingMaskIntoConstraints = false
        secondLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        secondLine.widthAnchor.constraint(equalToConstant: 10).isActive = true
        secondLine.backgroundColor = .black
        secondLine.layer.cornerRadius = 1
        $0.addSubview(firstLine)
        $0.addSubview(secondLine)
        NSLayoutConstraint.activate([
            firstLine.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 12),
            firstLine.topAnchor.constraint(equalTo: $0.topAnchor, constant: 15),
            
            secondLine.topAnchor.constraint(equalTo: firstLine.bottomAnchor, constant: 4),
            secondLine.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 12),
        ])
        return $0
    }(UIView())
    
    private lazy var locationView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.widthAnchor.constraint(equalToConstant: 150).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        let deliveredToBtn = UIButton(primaryAction: deliveredToAction)
        deliveredToBtn.setTitle("Адрес доставки >", for: .normal)
        deliveredToBtn.setTitleColor(UIColor(red: 140/255, green: 144/255, blue: 153/255, alpha: 1), for: .normal)
        deliveredToBtn.translatesAutoresizingMaskIntoConstraints = false
        deliveredToBtn.heightAnchor.constraint(equalToConstant: 18).isActive = true
        deliveredToBtn.widthAnchor.constraint(equalToConstant: 130).isActive = true
        $0.addSubview(deliveredToBtn)
        $0.addSubview(locationLabel)
        NSLayoutConstraint.activate([
            deliveredToBtn.topAnchor.constraint(equalTo: $0.topAnchor),
            deliveredToBtn.centerXAnchor.constraint(equalTo: $0.centerXAnchor),
            
            locationLabel.bottomAnchor.constraint(equalTo: $0.bottomAnchor),
            locationLabel.centerXAnchor.constraint(equalTo: $0.centerXAnchor),
        ])
        return $0
    }(UIView())
    
    private lazy var locationLabel : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = UIColor(red: 108/255, green: 187/255, blue: 95/255, alpha: 1)
        $0.widthAnchor.constraint(equalToConstant: 150).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var userAvatarPhoto: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
        $0.contentMode = .scaleAspectFill
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
        $0.image = UIImage(named: userData.photo)
        return $0
    }(UIImageView())
    
    private lazy var whatYouOrder: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
        $0.text = "Что бы вы хотели заказать ?"
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    // MARK: Жесты
    private lazy var tapGestureShowMenu: UITapGestureRecognizer = {
        $0.addTarget(self, action: #selector(tapForShowMenuBtn(sender: )))
        return $0
    }(UITapGestureRecognizer())
    
    private lazy var tapGestureHiddenShowMenu: UITapGestureRecognizer = {
        $0.addTarget(self, action: #selector(tapForHiddenShowMenu(sender: )))
        return $0
    }(UITapGestureRecognizer())
    
    
    // MARK: Обработка жестов
    @objc
    func tapForShowMenuBtn(sender: UITapGestureRecognizer){
        UIView.animate(withDuration: 0.5) {
            self.view.addSubview(self.menuUser)
            self.menuUser.frame = CGRect(x: 0, y: 0, width: (self.view.frame.width - 140), height: self.view.frame.height)
            self.mainView.frame.origin.x = (self.view.frame.width - 140)
            self.view.addSubview(self.blurEffect)
            UIView.animate(withDuration: 0.5) {
                self.blurEffect.frame = CGRect(x: (self.view.frame.width - 140), y: 0, width: (self.view.frame.width - 140), height: self.view.frame.height)
            }
            self.tabBarController?.tabBar.isHidden = true
        }
    }
    @objc
    func tapForHiddenShowMenu(sender: UITapGestureRecognizer){
        if self.menuUser.frame.size.width > 0 {
            UIView.animate(withDuration: 0.5) {
                self.menuUser.frame = CGRect(x: -(self.view.frame.width / 2), y: 0, width: 0, height: 0)
                self.mainView.frame.origin.x = 0
                self.blurEffect.removeFromSuperview()
                self.menuUser.removeFromSuperview()
                self.tabBarController?.tabBar.isHidden = false
            }
        }
    }
    
    
    // MARK: Элементы Action
    private lazy var deliveredToAction = UIAction { _ in
        print("deliveredAdress")
        self.getLocation(locationName: "Куруш, рядом с заправкой")
        //надо настроить
    }
    
    private lazy var actionForMyOrderbtn = UIAction { _ in
        print("Ваши заказы")
    }
    
    private lazy var actionForMyProfileBtn = UIAction { _ in
        print("Мой профиль")
    }
    
    private lazy var actionFotMyAddressBtn = UIAction { _ in
        print("Выбор адреса доставки")
    }
    
    private lazy var actionForContactUsBtn = UIAction { _ in
        print("Вы связались с разработчиком")
    }
    
    private lazy var actionForSettingBtn = UIAction { _ in
        print("Настройки")
    }
    
    private lazy var actionForExitBtn = UIAction { _ in
        FirebaseManager.firebaseManager.signOut()
        NotificationCenter.default.post(name: NSNotification.Name("changeVc"), object: nil, userInfo: ["isLogin": false])
    }
    
    
    // MARK: SearchController
    private lazy var searchController: UISearchBar = {
        $0.searchTextField.enablesReturnKeyAutomatically = false
        $0.clipsToBounds = true
        $0.delegate = self
        $0.searchTextField.delegate = self
        $0.placeholder = "Поиск"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.searchBarStyle = .minimal
    return $0
    }(UISearchBar())
    
    // MARK: Функции
    func getLocation(locationName: String){
        self.locationLabel.text = locationName
    }
    
    func setupViewsInViewDidLoad() {
        view.addSubview(mainView)
        
        mainView.addSubview(btnShowMenu)
        mainView.addSubview(locationView)
        mainView.addSubview(userAvatarPhoto)
        mainView.addSubview(whatYouOrder)
        mainView.addSubview(searchController)
        mainView.addSubview(collection)
        
        
        NSLayoutConstraint.activate([
            btnShowMenu.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor),
            btnShowMenu.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 26),
            
            locationView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor),
            locationView.leadingAnchor.constraint(equalTo: btnShowMenu.trailingAnchor, constant: 48),
            
            userAvatarPhoto.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -26),
            userAvatarPhoto.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor),
            
            whatYouOrder.topAnchor.constraint(equalTo: btnShowMenu.bottomAnchor, constant: 32),
            whatYouOrder.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 26),
            whatYouOrder.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -26),
            
            searchController.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 26),
            searchController.topAnchor.constraint(equalTo: whatYouOrder.bottomAnchor, constant: 20),
            searchController.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -26),
            
            collection.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            collection.topAnchor.constraint(equalTo: searchController.bottomAnchor, constant: 10),
            collection.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),
            
        ])
    }
    
}

// MARK: Extension
extension ViewController: UICollectionViewDataSource {
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        modelData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionData = modelData[indexPath.section]
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupComponentsCell.reuseId, for: indexPath) as! GroupComponentsCell
            cell.configCell(data: sectionData.items[indexPath.item])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComponentsCell.reuseId, for: indexPath) as! ComponentsCell
            cell.configCell(data: sectionData.items[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard indexPath.section == 1 else { return UICollectionReusableView() }
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.reuseId, for: indexPath) as? Header else { return UICollectionReusableView()}
        header.delegate = self
        return header
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionData = modelData[indexPath.section]
        switch indexPath.section {
        case 0:
            let vc = GroupControllers()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = ComponentView()
            vc.configComponentView(data: sectionData.items[indexPath.item])
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController: UISearchBarDelegate, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.endEditing(true)
    }
    
}
