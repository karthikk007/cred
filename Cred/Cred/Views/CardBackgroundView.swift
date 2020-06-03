//
//  CardActionsView.swift
//  Cred
//
//  Created by Kumar, Karthik on 27/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

class CardBackgroundView: UIView {
    
    let leftActionsView: CardActionsView = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(CardActionsView())
    
    let rightActionsView: CardActionsView = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(CardActionsView())
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(leftActionsView)
        addSubview(rightActionsView)
        
        NSLayoutConstraint.activate([
            leftActionsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leftActionsView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            leftActionsView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            leftActionsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            rightActionsView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            rightActionsView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            rightActionsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rightActionsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        

    }
    
    func setLeftActionItems(with items: [ActionItem]?) {
        leftActionsView.actionItems = items
    }
    
    func setRightActionItems(with items: [ActionItem]?) {
        rightActionsView.actionItems = items
    }
}
