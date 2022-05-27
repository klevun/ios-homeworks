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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Фото"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.navigationController?.navigationBar.isHidden = true
    }



    func setupCell(_ cell: Photos) {
        image.image = cell.image
    }

    private func setupView() {

        UIView.animate(withDuration: 0.5, delay: 0) {
            self.view.addSubview(self.back)
            self.view.addSubview(self.image)

            self.view.backgroundColor = .white
            self.back.alpha = 0.5
            self.image.alpha = 1

            let topViewConstraint = self.back.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            let bottomViewConstraint = self.back.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            let leadingViewConstraint = self.back.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
            let trailingViewConstraint = self.back.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)

            let xCenterImageConstraint = self.image.centerXAnchor.constraint(equalTo: self.back.centerXAnchor)
            let yCenterImageConstraint = self.image.centerYAnchor.constraint(equalTo: self.back.centerYAnchor)
            let widthImage = self.image.widthAnchor.constraint(equalTo: self.back.widthAnchor)
            let hieghtImage = self.image.heightAnchor.constraint(equalTo: self.back.widthAnchor)

            NSLayoutConstraint.activate([topViewConstraint, bottomViewConstraint, leadingViewConstraint, trailingViewConstraint,
                                        xCenterImageConstraint, yCenterImageConstraint, widthImage, hieghtImage].compactMap( { $0 } ))
        } completion: { _ in

        }

    }

}
