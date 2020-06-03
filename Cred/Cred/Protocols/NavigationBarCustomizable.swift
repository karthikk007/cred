//
//  NavigationBarCustomizable.swift
//  Cred
//
//  Created by Kumar, Karthik on 26/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

protocol NavigationBarCustomizable where Self: UIViewController  {
    var navigationTitle: String { get }
//    var leftNavigationItem: NavigationItem? { get }
//    var rightNavigationItem: NavigationItem? { get }
    
    func setupNavigationBar()
}

extension NavigationBarCustomizable {
//    var leftNavigationItem: NavigationItem? {
//        return nil
//    }
    
//    var rightNavigationItem: NavigationItem? {
//        return nil
//    }
    
    func setupNavigationBar() {
        setupNavigationBar(with: navigationTitle)
        
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColor.secondary.color,
                                                                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .bold)]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColor.secondary.color,
                                                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .bold)]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
