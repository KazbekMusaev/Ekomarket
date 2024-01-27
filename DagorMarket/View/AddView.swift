//
//  AddView.swift
//  DagorMarket
//
//  Created by apple on 21.01.2024.
//

import UIKit

class AddView {
    
    func getAddToFavoriteBtn(styleEffect: UIBlurEffect.Style) -> UIView {
        let heartView = UIImageView(image: UIImage(systemName: "heart.fill"))
        heartView.translatesAutoresizingMaskIntoConstraints = false
        heartView.heightAnchor.constraint(equalToConstant: 13.92).isActive = true
        heartView.widthAnchor.constraint(equalToConstant: 15.23).isActive = true
        heartView.tintColor = .white
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        backgroundView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        backgroundView.layer.cornerRadius = 14
        backgroundView.clipsToBounds = true
        let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: styleEffect))
        blurEffect.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(blurEffect)
        backgroundView.addSubview(heartView)
        NSLayoutConstraint.activate([
            blurEffect.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            blurEffect.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            blurEffect.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            blurEffect.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
            heartView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            heartView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        ])
        return backgroundView
    }
    
    func getNameLabelForComponent() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }
    
    func getDescriptionForComponent() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIColor(red: 151/255, green: 150/255, blue: 161/255, alpha: 1)
        return label
    }
    
    func getMenuView(userName: String, userPhoto: String, userMailText: String, actionForMyOrderBtn: UIAction, actionForMyProfileBtn: UIAction, actionForMyAddressBtn: UIAction, actionForContactUsBtn: UIAction, actionForSettingBtn: UIAction, actionForExitBtn: UIAction) -> UIView {
        
        let menuView = UIView()
        menuView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        menuView.backgroundColor = .white
        
        let imageProfile = UIImageView()
        imageProfile.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageProfile.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageProfile.layer.cornerRadius = 45
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        imageProfile.clipsToBounds = true
        imageProfile.contentMode = .scaleAspectFill
        imageProfile.image = UIImage(named: userPhoto)
        menuView.addSubview(imageProfile)
        
        let nameUser = UILabel()
        nameUser.text = userName
        nameUser.font = .boldSystemFont(ofSize: 20)
        nameUser.translatesAutoresizingMaskIntoConstraints = false
        nameUser.textColor = .black
        nameUser.textAlignment = .left
        menuView.addSubview(nameUser)
        
        let userMail = UILabel()
        userMail.text = userMailText
        userMail.translatesAutoresizingMaskIntoConstraints = false
        userMail.font = .systemFont(ofSize: 14)
        userMail.textColor = UIColor(red: 158/255, green: 161/255, blue: 177/255, alpha: 1)
        userMail.textAlignment = .left
        menuView.addSubview(userMail)
        
        let myOrderBtn = UIButton(primaryAction: actionForMyOrderBtn)
        myOrderBtn.setTitle("Мои заказы", for: .normal)
        myOrderBtn.setTitleColor(UIColor.black, for: .normal)
        myOrderBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let imageMyOrderBtn = UIImageView(image: UIImage(systemName: "list.bullet.rectangle.portrait.fill"))
        imageMyOrderBtn.clipsToBounds = true
        imageMyOrderBtn.contentMode = .scaleAspectFill
        imageMyOrderBtn.translatesAutoresizingMaskIntoConstraints = false
        imageMyOrderBtn.heightAnchor.constraint(equalToConstant: 23).isActive = true
        imageMyOrderBtn.widthAnchor.constraint(equalToConstant: 23).isActive = true
        imageMyOrderBtn.tintColor = UIColor(red: 108/255, green: 187/255, blue: 95/255, alpha: 1)
        menuView.addSubview(imageMyOrderBtn)
        menuView.addSubview(myOrderBtn)
        
        let myProfileBtn = UIButton(primaryAction: actionForMyProfileBtn)
        myProfileBtn.setTitle("Мой профиль", for: .normal)
        myProfileBtn.setTitleColor(.black, for: .normal)
        myProfileBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let imageMyProgileBtn = UIImageView(image: UIImage(systemName: "person.fill"))
        imageMyProgileBtn.tintColor = UIColor(red: 108/255, green: 187/255, blue: 95/255, alpha: 1)
        imageMyProgileBtn.contentMode = .scaleAspectFill
        imageMyProgileBtn.clipsToBounds = true
        imageMyProgileBtn.translatesAutoresizingMaskIntoConstraints = false
        imageMyProgileBtn.heightAnchor.constraint(equalToConstant: 23).isActive = true
        imageMyProgileBtn.widthAnchor.constraint(equalToConstant: 23).isActive = true
        menuView.addSubview(imageMyProgileBtn)
        menuView.addSubview(myProfileBtn)
        
        let deliveredAddressBtn = UIButton(primaryAction: actionForMyAddressBtn)
        deliveredAddressBtn.setTitle("Адрес доставки", for: .normal)
        deliveredAddressBtn.setTitleColor(.black, for: .normal)
        deliveredAddressBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let imageForDeliviredAddressBtn = UIImageView(image: UIImage(systemName: "mappin.and.ellipse"))
        imageForDeliviredAddressBtn.tintColor = UIColor(red: 113/255, green: 244/255, blue: 92/255, alpha: 1)
        imageForDeliviredAddressBtn.contentMode = .scaleAspectFill
        imageForDeliviredAddressBtn.clipsToBounds = true
        imageForDeliviredAddressBtn.translatesAutoresizingMaskIntoConstraints = false
        imageForDeliviredAddressBtn.heightAnchor.constraint(equalToConstant: 23).isActive = true
        imageForDeliviredAddressBtn.widthAnchor.constraint(equalToConstant: 23).isActive = true
        menuView.addSubview(imageForDeliviredAddressBtn)
        menuView.addSubview(deliveredAddressBtn)
        
        let contactUsBtn = UIButton(primaryAction: actionForContactUsBtn)
        contactUsBtn.setTitle("Тех. поддержка", for: .normal)
        contactUsBtn.setTitleColor(.black, for: .normal)
        contactUsBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let imageFotContactUsBtn = UIImageView(image: UIImage(systemName: "envelope.fill"))
        imageFotContactUsBtn.translatesAutoresizingMaskIntoConstraints = false
        imageFotContactUsBtn.contentMode = .scaleAspectFill
        imageFotContactUsBtn.clipsToBounds = true
        imageFotContactUsBtn.tintColor = UIColor(red: 151/255, green: 150/255, blue: 161/255, alpha: 1)
        imageFotContactUsBtn.heightAnchor.constraint(equalToConstant: 23).isActive = true
        imageFotContactUsBtn.widthAnchor.constraint(equalToConstant: 23).isActive = true
        menuView.addSubview(imageFotContactUsBtn)
        menuView.addSubview(contactUsBtn)
        
        let settingBtn = UIButton(primaryAction: actionForSettingBtn)
        settingBtn.setTitle("Настройки", for: .normal)
        settingBtn.setTitleColor(.black, for: .normal)
        settingBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let imageForSettingBtn = UIImageView(image: UIImage(systemName: "gearshape.fill"))
        imageForSettingBtn.contentMode = .scaleAspectFill
        imageForSettingBtn.clipsToBounds = true
        imageForSettingBtn.translatesAutoresizingMaskIntoConstraints = false
        imageForSettingBtn.tintColor = UIColor(red: 211/255, green: 209/255, blue: 216/255, alpha: 1)
        imageForSettingBtn.heightAnchor.constraint(equalToConstant: 23).isActive = true
        imageForSettingBtn.widthAnchor.constraint(equalToConstant: 23).isActive = true
        menuView.addSubview(imageForSettingBtn)
        menuView.addSubview(settingBtn)
        
        let exitProfile = UIButton(primaryAction: actionForExitBtn)
        exitProfile.setTitle("Выйти", for: .normal)
        exitProfile.setTitleColor(.black, for: .normal)
        exitProfile.backgroundColor = UIColor(red: 51/255, green: 202/255, blue: 26/255, alpha: 1)
        exitProfile.layer.cornerRadius = 21
        exitProfile.translatesAutoresizingMaskIntoConstraints = false
        exitProfile.heightAnchor.constraint(equalToConstant: 43).isActive = true
        menuView.addSubview(exitProfile)
        
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 100),
            imageProfile.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 26),
            
            nameUser.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 26),
            nameUser.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 21),
            nameUser.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -10),
            
            userMail.topAnchor.constraint(equalTo: nameUser.bottomAnchor, constant: 7),
            userMail.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 26),
            userMail.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -10),
            
            imageMyOrderBtn.topAnchor.constraint(equalTo: userMail.bottomAnchor, constant: 44),
            imageMyOrderBtn.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 24),
            myOrderBtn.topAnchor.constraint(equalTo: userMail.bottomAnchor, constant: 41),
            myOrderBtn.leadingAnchor.constraint(equalTo: imageMyOrderBtn.trailingAnchor, constant: 14),
            
            imageMyProgileBtn.topAnchor.constraint(equalTo: imageMyOrderBtn.bottomAnchor, constant: 35),
            imageMyProgileBtn.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 24),
            myProfileBtn.topAnchor.constraint(equalTo: myOrderBtn.bottomAnchor, constant: 30),
            myProfileBtn.leadingAnchor.constraint(equalTo: imageMyProgileBtn.trailingAnchor, constant: 14),
            
            imageForDeliviredAddressBtn.topAnchor.constraint(equalTo: imageMyProgileBtn.bottomAnchor, constant: 35),
            imageForDeliviredAddressBtn.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 24),
            deliveredAddressBtn.topAnchor.constraint(equalTo: myProfileBtn.bottomAnchor, constant: 27),
            deliveredAddressBtn.leadingAnchor.constraint(equalTo: imageForDeliviredAddressBtn.trailingAnchor, constant: 14),
            
            imageFotContactUsBtn.topAnchor.constraint(equalTo: imageForDeliviredAddressBtn.bottomAnchor, constant: 35),
            imageFotContactUsBtn.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 24),
            contactUsBtn.leadingAnchor.constraint(equalTo: imageFotContactUsBtn.trailingAnchor, constant: 14),
            contactUsBtn.topAnchor.constraint(equalTo: deliveredAddressBtn.bottomAnchor, constant: 28),
            
            imageForSettingBtn.topAnchor.constraint(equalTo: imageFotContactUsBtn.bottomAnchor, constant: 36),
            imageForSettingBtn.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 24),
            settingBtn.leadingAnchor.constraint(equalTo: imageForSettingBtn.trailingAnchor, constant: 14),
            settingBtn.topAnchor.constraint(equalTo: contactUsBtn.bottomAnchor, constant: 28),
            
            exitProfile.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 22),
            exitProfile.bottomAnchor.constraint(equalTo: menuView.bottomAnchor, constant: -100),
            exitProfile.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -22),
            
            
            
            
        ])
        return menuView
    }
    
    func getMainView(frame: CGRect) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = frame
        return view
    }
    func getBlurEffect() -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    }
    
}
