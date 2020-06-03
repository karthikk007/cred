//
//  ActionItemView.swift
//  Cred
//
//  Created by Kumar, Karthik on 27/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

class ActionItemView: UIView {
    
    var actionItem: ActionItem?
    
    let iconImageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
       return $0
    }(UIImageView())
    
    let titleLabel: UILabel = {
        $0.dropShadow()
        $0.textColor = AppColor.Text.foreground.color
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with item: ActionItem) {
        actionItem = item
        titleLabel.text = item.action.title
        iconImageView.image = item.action.logo
    }
}
