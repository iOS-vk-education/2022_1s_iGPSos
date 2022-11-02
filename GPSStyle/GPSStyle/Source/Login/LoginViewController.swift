//
//  LoginViewController.swift
//  GPSStyle
//
//  Created by Алина Пахомова on 01.11.2022.
//

import UIKit

class LoginViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Войти"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Почта"
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 40, width: 360, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 40, width: 360, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.tintColor = .white
        button.backgroundColor = ColorName.mainPurple.color
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 33
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        addTargets()
    }
    
    private func addTargets() {
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
    }
                                
    @objc
    private func didTapCreateAccount() {
        LoginRouter.shared.gotoMainTabBarController(from: self)
    }
    
    func setupViews() { 
        view.backgroundColor = #colorLiteral(red: 0.918249011, green: 0.9182489514, blue: 0.9182489514, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(createAccountButton)
    }
}

extension LoginViewController {
    func setConstraints() {
        NSLayoutConstraint.activate ([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            createAccountButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
