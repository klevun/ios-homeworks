//
//  TabBar.swift
//  Navigation
//
//  Created by Никита Базанков on 21.02.2022.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = .label
           setupVCs()
    }

    func setupVCs() {
          viewControllers = [
              createNavController(for: NewslineNavController(), title: NSLocalizedString("Лента", comment: ""), image: UIImage(systemName: "scribble")!),
              createNavController(for: ProfileNavController(), title: NSLocalizedString("Профиль", comment: ""), image: UIImage(systemName: "person")!)
          ]
      }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title = title
          return navController
      }

}
