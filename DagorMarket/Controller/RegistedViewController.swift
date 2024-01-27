//
//  RegistedViewController.swift
//  DagorMarket
//
//  Created by apple on 27.01.2024.
//

import UIKit

final class RegistedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        settupView()
    }
    
    private func settupView() {
        view.addSubview(image)
        view.addSubview(registredDetails)
        
        registredDetails.addSubview(welcomeBack)
        registredDetails.addSubview(detailsLabel)
        registredDetails.addSubview(fullName)
        registredDetails.addSubview(fullNameTextField)
        registredDetails.addSubview(emailLabel)
        registredDetails.addSubview(emailTextField)
        registredDetails.addSubview(phoneNumber)
        registredDetails.addSubview(phoneTextField)
        registredDetails.addSubview(passwordLabel)
        registredDetails.addSubview(passwordTextField)
        registredDetails.addSubview(registredBtn)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            registredDetails.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            registredDetails.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registredDetails.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registredDetails.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            welcomeBack.topAnchor.constraint(equalTo: registredDetails.topAnchor, constant: 24),
            welcomeBack.centerXAnchor.constraint(equalTo: registredDetails.centerXAnchor),
            
            detailsLabel.topAnchor.constraint(equalTo: welcomeBack.bottomAnchor, constant: 8),
            detailsLabel.centerXAnchor.constraint(equalTo: registredDetails.centerXAnchor),
            
            fullName.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 20),
            fullName.leadingAnchor.constraint(equalTo: registredDetails.leadingAnchor,constant: 22),
            
            fullNameTextField.leadingAnchor.constraint(equalTo: registredDetails.leadingAnchor, constant: 22),
            fullNameTextField.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 4),
            fullNameTextField.trailingAnchor.constraint(equalTo: registredDetails.trailingAnchor, constant: -22),
            
            emailLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 16),
            emailLabel.leadingAnchor.constraint(equalTo: registredDetails.leadingAnchor, constant: 22),
            
            emailTextField.leadingAnchor.constraint(equalTo: registredDetails.leadingAnchor, constant: 22),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 4),
            emailTextField.trailingAnchor.constraint(equalTo: registredDetails.trailingAnchor, constant: -22),
            
            phoneNumber.leadingAnchor.constraint(equalTo: registredDetails.leadingAnchor, constant: 22),
            phoneNumber.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            
            phoneTextField.leadingAnchor.constraint(equalTo: registredDetails.leadingAnchor, constant: 22),
            phoneTextField.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 4),
            phoneTextField.trailingAnchor.constraint(equalTo: registredDetails.trailingAnchor, constant: -22),
            
            passwordLabel.leadingAnchor.constraint(equalTo: registredDetails.leadingAnchor, constant: 22),
            passwordLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 16),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 4),
            passwordTextField.leadingAnchor.constraint(equalTo: registredDetails.leadingAnchor, constant: 22),
            passwordTextField.trailingAnchor.constraint(equalTo: registredDetails.trailingAnchor, constant: -22),
            
            registredBtn.leadingAnchor.constraint(equalTo: registredDetails.leadingAnchor, constant: 22),
            registredBtn.trailingAnchor.constraint(equalTo: registredDetails.trailingAnchor, constant: -22),
            registredBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            
        ])
    }
    
    
    
    private lazy var welcomeBack = getLabel(text: "Добро пожаловать", font: .boldSystemFont(ofSize: 24), textColor: .black)
    
    private lazy var detailsLabel = getLabel(text: "Заполните поля регистрации", font: UIFont.systemFont(ofSize: 16, weight: .regular), textColor: UIColor(red: 164/255, green: 165/255, blue: 180/255, alpha: 1))
    
    private lazy var fullName = getLabel(text: "Полное имя", font: .boldSystemFont(ofSize: 14), textColor: .black)
    
    private lazy var fullNameTextField = getTextField(placeholder: "Напишите свое полное имя")
    
    private lazy var emailLabel = getLabel(text: "Email", font: .boldSystemFont(ofSize: 14), textColor: .black)
    
    private lazy var emailTextField = getTextField(placeholder: "Напишите свой email")
    
    private lazy var phoneNumber = getLabel(text: "Номер телефона", font: .boldSystemFont(ofSize: 14), textColor: .black)
    
    private lazy var phoneTextField = getTextField(placeholder: "+7-989-555-55-55")
    
    private lazy var passwordLabel = getLabel(text: "Пароль", font: .boldSystemFont(ofSize: 14), textColor: .black)
    
    private lazy var passwordTextField = getTextField(placeholder: "Введите пароль", isPassword: true)
    
    private lazy var registredDetails: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40
        return $0
    }(UIView())
    
    private lazy var image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.heightAnchor.constraint(equalToConstant: 310).isActive = true
        $0.clipsToBounds = true
        return $0
    }(UIImageView(image: UIImage(named: "registredImage")))
    
    private func getLabel(text: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.textColor = textColor
        return label
    }
    
    private lazy var registredBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        $0.backgroundColor = UIColor(red: 82/255, green: 210/255, blue: 60/255, alpha: 1)
        $0.setTitle("Зарегистрироваться", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 24
        return $0
    }(UIButton(primaryAction: actionRegistredBtn))
    
    private lazy var actionRegistredBtn = UIAction { [weak self] _ in
        guard let self = self else { return }
        guard let email = self.emailTextField.text else { print("Введите email"); return}
        guard let password = self.passwordTextField.text else { print("Введите пароль"); return}
        FirebaseManager.firebaseManager.createNewUser(email: email, password: password) { isReg in
            if isReg == true {
               print("Регистрация прошла успешно")
                self.navigationController?.popViewController(animated: true)
            } else {
                print("Вы не смогли зарегистрироваться")
            }
        }
    }
    
    private func getTextField(placeholder: String, isPassword: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: .zero))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.delegate = self
        textField.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 247/255, alpha: 1)
        
        if isPassword == false {
            textField.isSecureTextEntry = isPassword
            textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: .zero))
            textField.rightViewMode = .always
        } else {
            textField.isSecureTextEntry = true
            let action = UIAction { _ in
                let boolean = textField.isSecureTextEntry == true ? false : true
                textField.isSecureTextEntry = boolean
            }
            let showPassword = UIButton(primaryAction: action)
            showPassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            showPassword.tintColor = .gray
            textField.rightView = showPassword
            textField.rightViewMode = .always
        }
        
        return textField
    }
    
    

}

extension RegistedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}
