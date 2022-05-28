//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Никита Базанков on 22.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private var photo = Photos.showPhoto()
    private var cell: UICollectionViewCell?

    private lazy var largeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
        button.isHidden = true
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlow)
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    private lazy var collectionViewFlow: UICollectionViewFlowLayout = {
        let collection = UICollectionViewFlowLayout()
        collection.scrollDirection = .vertical
        collection.minimumLineSpacing = 8
        collection.minimumInteritemSpacing = 8
        return collection
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Галлерея"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }

    lazy var heightLargeImage = self.largeImage.heightAnchor.constraint(equalToConstant: 0)
    lazy var widthLargeImage = self.largeImage.widthAnchor.constraint(equalToConstant: 0)
    lazy var xCenterLargeImage = self.largeImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
    lazy var yCenterLargeImage = self.largeImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)

    private func layout() {
        view.addSubview(collectionView)
        view.addSubview(backView)
        view.addSubview(largeImage)
        view.addSubview(closeButton)
        view.backgroundColor = .white

        let topCollectionConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let bottomCollectionConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let leadingCollectionConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingCollectionConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)

        let topBackViewConstraint = self.backView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let bottomBackViewConstraint = self.backView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let leadingBackViewConstraint = self.backView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingBackViewConstraint = self.backView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)

        let topButtonConstraint = self.closeButton.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 15)
        let trailingButtonConstraint = self.closeButton.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -15)


        NSLayoutConstraint.activate([topCollectionConstraint, bottomCollectionConstraint, leadingCollectionConstraint, trailingCollectionConstraint,
                                    heightLargeImage, widthLargeImage, xCenterLargeImage, yCenterLargeImage,
                                    topBackViewConstraint, bottomBackViewConstraint, leadingBackViewConstraint, trailingBackViewConstraint,
                                    topButtonConstraint, trailingButtonConstraint].compactMap( { $0 } ))
    }

    @objc private func closePressed() {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.closeButton.isHidden = true
            self.backView.alpha = 0
        } completion: { _ in
            self.widthLargeImage.constant = 0
            self.heightLargeImage.constant = 0

            self.view.layoutIfNeeded()
        }

    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        collection.setupCell(photo[indexPath.row])
        return collection
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = photo[indexPath.item]
        cell = collectionView.cellForItem(at: indexPath)
        largeImage.center = cell!.center

        UIView.animate(withDuration: 0.5, delay: 0) {
            self.backView.alpha = 0.5
            self.largeImage.image = image.image
            self.largeImage.contentMode = .scaleAspectFit
            self.widthLargeImage.constant = self.view.frame.width
            self.heightLargeImage.constant = self.view.frame.width
            self.closeButton.isHidden = false
            self.view.layoutIfNeeded()
        } completion: { _ in

        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 8 * 4) / 3
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}
