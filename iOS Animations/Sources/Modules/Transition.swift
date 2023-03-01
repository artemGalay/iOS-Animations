//
//  Transition.swift
//  iOS Animations
//
//  Created by Артем Галай on 1.03.23.
//

import UIKit

final class Transition: UIViewController {

    private let animateContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let penguinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "penguin")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let bearImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bear")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)



        UIView.transition(with: animateContainerView,
                          duration: 0.5,
                          options: [.curveEaseOut, .transitionFlipFromBottom],
                          animations: {
            self.animateContainerView.addSubview(self.penguinImage)
            self.animateContainerView.addSubview(self.bearImage)

        },
                          completion: nil
        )

        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(animateContainerView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            animateContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            animateContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animateContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animateContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            penguinImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            penguinImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            penguinImage.widthAnchor.constraint(equalToConstant: 200),
            penguinImage.heightAnchor.constraint(equalToConstant: 200),

            bearImage.topAnchor.constraint(equalTo: penguinImage.bottomAnchor, constant: 20),
            bearImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bearImage.widthAnchor.constraint(equalToConstant: 100),
            bearImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
