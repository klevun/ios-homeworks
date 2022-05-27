//
//  PhotoView.swift
//  Navigation
//
//  Created by Никита Базанков on 27.05.2022.
//

import UIKit

class PhotoView: UIViewController {

    private lazy var back: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(closePhoto), for: .touchUpInside)
        button.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


    func setupCell(_ cell: Photos) {
        image.image = cell.image
    }

    private func setupView() {

        UIView.animate(withDuration: 0.5, delay: 0) {
            self.view.addSubview(self.back)
            self.view.addSubview(self.image)
            self.view.addSubview(self.closeButton)

            self.view.backgroundColor = .white
            self.back.alpha = 0.5
            self.image.alpha = 1

            let topViewConstraint = self.back.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            let bottomViewConstraint = self.back.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            let leadingViewConstraint = self.back.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
            let trailingViewConstraint = self.back.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)

            let topButtonConstraint = self.closeButton.topAnchor.constraint(equalTo: self.back.topAnchor, constant: 15)
            let trailingBottomConstraint = self.closeButton.trailingAnchor.constraint(equalTo: self.back.trailingAnchor, constant: -15)

            let xCenterImageConstraint = self.image.centerXAnchor.constraint(equalTo: self.back.centerXAnchor)
            let yCenterImageConstraint = self.image.centerYAnchor.constraint(equalTo: self.back.centerYAnchor)
            let widthImage = self.image.widthAnchor.constraint(equalTo: self.back.widthAnchor)
            let hieghtImage = self.image.heightAnchor.constraint(equalTo: self.back.widthAnchor)

            NSLayoutConstraint.activate([topViewConstraint, bottomViewConstraint, leadingViewConstraint, trailingViewConstraint,
                                        topButtonConstraint, trailingBottomConstraint,
                                        xCenterImageConstraint, yCenterImageConstraint, widthImage, hieghtImage].compactMap( { $0 } ))
        } completion: { _ in

        }

    }

    @objc private func closePhoto() {
        let commingBack = PhotosViewController()
        navigationController?.pushViewController(commingBack, animated: true)
    }

}
