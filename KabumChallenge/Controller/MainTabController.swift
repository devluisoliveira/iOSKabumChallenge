//
//  MainTabController.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 15/10/21.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    //MARK: - Helpers
    func configureViewControllers() {
        
        ///Início
        let initial = StartViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationController(image: UIImage(systemName: "house.fill"), rootViewController: initial, title: "Início")
        
        ///Categorias
        let category = CategoryViewController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "list.dash"), rootViewController: category, title: "Categorias")
        
        ///Favoritos
        let favorites = FavoritesViewController()
        let nav3 = templateNavigationController(image: UIImage(systemName: "heart.fill"), rootViewController: favorites, title: "Favoritos")
        
        ///Minha Conta
        let myAccount = MyAccountViewController()
        let nav4 = templateNavigationController(image: UIImage(systemName: "person.circle"), rootViewController: myAccount, title: "Minha Conta")
        
        viewControllers = [nav1,nav2,nav3,nav4]
    }
    
    //MARK: - TemplateNavigationController
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController, title: String?) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        nav.view.backgroundColor = .blueKabum
        return nav
    }
}
