//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита Базанков on 22.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var uslessButton: UIButton = {
        let button = UIButton()
        button.setTitle("Бесполезная кнопка", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var bottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.setupView()
    }

    override func viewWillLayoutSubviews() {
        
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        self.bottomConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 280)

        let bottomUslessButtonConstraint = self.uslessButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let leadingUslessButtonConstraint = self.uslessButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0)
        let trailingUslessButtonConstraint = self.uslessButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)


        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, self.bottomConstraint,
                                     bottomUslessButtonConstraint, leadingUslessButtonConstraint, trailingUslessButtonConstraint].compactMap({ $0 }))

        profileHeaderView.backgroundColor = .lightGray

    }

    private func setupView() {
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.uslessButton)
    }

}

extension ProfileViewController: ProfileHeaderViewProtocol {

    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {

        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}
