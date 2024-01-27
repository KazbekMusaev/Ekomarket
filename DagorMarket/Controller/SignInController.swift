//
//  SignInController.swift
//  DagorMarket
//
//  Created by apple on 27.01.2024.
//

import UIKit

final class SignInController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        settupView()
    }
    
    private func getLabel(text: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.text = text
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func getTextField(placeholder: String, isPassword: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.textColor = .black
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: .zero))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
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
        textField.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 247/255, alpha: 1)
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return textField
    }
    
    private func settupView() {
        view.addSubview(imageHeader)
        view.addSubview(loginView)
        
        loginView.addSubview(welcomeBack)
        loginView.addSubview(descriptionForLogin)
        loginView.addSubview(emailLabel)
        loginView.addSubview(emailTextField)
        loginView.addSubview(passwordLabel)
        loginView.addSubview(passwordTextField)
        loginView.addSubview(signInBtn)
        loginView.addSubview(forgotPasswordBtn)
        loginView.addSubview(dontHaveAccount)
        loginView.addSubview(registredBtn)
        
        NSLayoutConstraint.activate([
            imageHeader.topAnchor.constraint(equalTo: view.topAnchor),
            imageHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 280),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            welcomeBack.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 24),
            welcomeBack.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            
            descriptionForLogin.topAnchor.constraint(equalTo: welcomeBack.bottomAnchor, constant: 8),
            descriptionForLogin.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            
            emailLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 22),
            emailLabel.topAnchor.constraint(equalTo: descriptionForLogin.bottomAnchor, constant: 24),
            
            emailTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 22),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 4),
            emailTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -22),
            
            passwordLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 22),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            
            passwordTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 22),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 4),
            passwordTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -22),
            
            signInBtn.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 22),
            signInBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            signInBtn.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -22),
            
            forgotPasswordBtn.topAnchor.constraint(equalTo: signInBtn.bottomAnchor, constant: 24),
            forgotPasswordBtn.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            
            dontHaveAccount.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -45),
            dontHaveAccount.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 36),
            
            registredBtn.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -36),
            registredBtn.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -38),
            
            
        ])
    }
    
    private lazy var passwordTextField = getTextField(placeholder: "Напишите пароль", isPassword: true)
    private lazy var passwordLabel = getLabel(text: "Пароль", font: .boldSystemFont(ofSize: 14), textColor: .black)
    
    private lazy var dontHaveAccount = getLabel(text: "У вас нет аккаунта? ", font: UIFont.systemFont(ofSize: 16, weight: .regular), textColor: UIColor(red: 50/255, green: 52/255, blue: 61/255, alpha: 1))
    
    private lazy var emailTextField = getTextField(placeholder: "Напишите тут свою почту")
    private lazy var emailLabel = getLabel(text: "Email", font: .boldSystemFont(ofSize: 14), textColor: .black)
    
    private lazy var signInBtn: UIButton = {
        $0.setTitle("Войти", for: .normal)
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(red: 82/255, green: 210/255, blue: 60/255, alpha: 1)
        $0.layer.cornerRadius = 24
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return $0
    }(UIButton(primaryAction: signInAction))
    
    private lazy var signInAction = UIAction { [weak self] _ in
        guard let self = self else { return }
        guard let email = self.emailTextField.text else { print("Введите email"); return}
        guard let password = self.passwordTextField.text else {print("Введите пароль"); return}
        FirebaseManager.firebaseManager.signIn(email: email, password: password) { isSignIN in
            if isSignIN {
                NotificationCenter.default.post(name: NSNotification.Name("changeVc"), object: nil, userInfo: ["isLogin": true])
            } else {
                print("Не получилось войти")
            }
        }
    }
    
    private lazy var forgotPasswordBtn: UIButton = {
        $0.setTitle("Забыли пароль?", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: forgotPasswordAction))
    
    private lazy var forgotPasswordAction = UIAction { [weak self] _ in
        print("Вы забыли пароль")
    }
    
    private lazy var welcomeBack = getLabel(text: "Добро пожаловать!", font: .boldSystemFont(ofSize: 24), textColor: .black)
    private lazy var descriptionForLogin = getLabel(text: "Войдите, чтобы заказать продукты", font: UIFont.systemFont(ofSize: 16, weight: .regular), textColor: UIColor(red: 164/255, green: 165/255, blue: 180/255, alpha: 1))

    private lazy var imageHeader: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 310).isActive = true
        $0.clipsToBounds = true
        return $0
    }(UIImageView(image: UIImage(named: "loginImage")))
    
    private lazy var loginView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 40
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private lazy var registredBtn: UIButton = {
        $0.setTitle("Зарегистрироваться", for: .normal)
        $0.setTitleColor(UIColor(red: 82/255, green: 210/255, blue: 60/255, alpha: 1), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: registredAction))
    
    private lazy var registredAction = UIAction { [weak self] _ in
        guard let self = self else { return}
        let vc = RegistedViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension SignInController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}
