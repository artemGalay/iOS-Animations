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
        textField.backgroundColor = .systemGray5
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray5
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let cloudImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloud")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let cloudImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloud")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let cloudImage3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloud")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .medium)
        activity.startAnimating()
        activity.alpha = 0.0
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()
        setupHierarchy()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.center.x -= view.bounds.width
        userNameTextField.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width

//        logInButton.center.y += 30.0
        logInButton.alpha = 0.0

        cloudImage.alpha = 0
        cloudImage2.alpha = 0
        cloudImage3.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.titleLabel.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 0.5, delay: 0.1, options: []) {
            self.userNameTextField.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 0.5, delay: 0.3) {
            self.passwordTextField.center.x += self.view.bounds.width
        }

        UIView.animate(withDuration: 0.5, delay: 0.5) {
            self.cloudImage.alpha = 1
        }
        UIView.animate(withDuration: 0.5, delay: 0.7) {
            self.cloudImage2.alpha = 1
        }
        UIView.animate(withDuration: 0.5, delay: 1.1) {
            self.cloudImage3.alpha = 1
        }

        UIView.animate(withDuration: 0.5, // продолжительнось анимации
                       delay: 0.5,
                       usingSpringWithDamping: 0.5, // эффект пружины
                       initialSpringVelocity: 0.0,
                       options: [], animations: {
            self.logInButton.center.y -= 30.0
                      self.logInButton.bounds.size.width += 150.0
            self.logInButton.alpha = 1.0
            self.activityIndicator.alpha = 1.0
        }, completion: nil)
        self.setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        view.addSubview(cloudImage)
        view.addSubview(cloudImage2)
        view.addSubview(cloudImage3)
        view.addSubview(activityIndicator)
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
            logInButton.heightAnchor.constraint(equalToConstant: 50),

            cloudImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            cloudImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cloudImage.widthAnchor.constraint(equalToConstant: 200),
            cloudImage.heightAnchor.constraint(equalToConstant: 170),

            cloudImage2.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 50),
            cloudImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cloudImage2.widthAnchor.constraint(equalToConstant: 200),
            cloudImage2.heightAnchor.constraint(equalToConstant: 170),

            cloudImage3.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 80),
            cloudImage3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cloudImage3.widthAnchor.constraint(equalToConstant: 200),
            cloudImage3.heightAnchor.constraint(equalToConstant: 170),

            activityIndicator.centerYAnchor.constraint(equalTo: logInButton.centerYAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: logInButton.leadingAnchor)
        ])
    }

    @objc private func buttonTapped() {
        UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
//            self.logInButton.center.y += 60.0 // кнопка перемещается вниз
//            self.logInButton.bounds.size.width += 60.0 // кнопка увеличивается в размере в ширину
            self.logInButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)


        }, completion: nil)
    }
}
