//
//  MainViewController.swift
//  iOS Animations
//
//  Created by Артем Галай on 25.02.23.
//

import UIKit

final class MainViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.backgroundColor = .systemGray
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            userNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameTextField.widthAnchor.constraint(equalToConstant: 300),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.widthAnchor.constraint(equalToConstant: 100),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
