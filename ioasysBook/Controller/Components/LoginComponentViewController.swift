//
//  LoginComponentViewController.swift
//  ioasysBook
//
//  Created by Marcelo Simim on 10/02/22.
//

import UIKit

class LoginComponentViewController: UIViewController {
    
    private var showPassword = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        addComponents()
        settingConstraints()
    }
    
    //MARK: - UI Components
    
    lazy var emailTextField: CustomTextField = {
       let textField = CustomTextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    lazy var showPasswordIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "eye.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = UIColor(red: 0.463, green: 0.463, blue: 0.467, alpha: 1)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPasswordChange))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGestureRecognizer)
        
        return image
    }()
    
    lazy var passwordTextField: CustomTextField = {
       let textField = CustomTextField()
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        textField.rightView = showPasswordIcon
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("ENTRAR", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.backgroundColor = UIColor(red: 0.224, green: 0.082, blue: 0.294, alpha: 1).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(navigateToHome), for: .touchDown)
        return button
    }()
    
    //MARK: - Setting View
    
    private func addComponents(){
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    //MARK: - Constraints
    
    private func settingConstraints(){
        NSLayoutConstraint.activate([
            //view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 36),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 28),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 68),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
    //MARK: - Password 
    
    @objc func showPasswordChange(){
        showPassword = !showPassword
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        
        if showPassword {
            showPasswordIcon.image = UIImage(systemName: "eye.slash.fill")
        }else{
            showPasswordIcon.image = UIImage(systemName: "eye.fill")
        }
    }
    
    //MARK: - Navigation
    
    @objc func navigateToHome(){
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}

extension LoginComponentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
