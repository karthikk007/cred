//
//  CardForegroundView.swift
//  Cred
//
//  Created by Kumar, Karthik on 27/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

class CardForegroundView: UIView {
    
    let brandLabel: UILabel = {
        $0.dropShadow()
        $0.textColor = AppColor.Text.foreground.color
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    let logoImageView: UIImageView = {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIImageView())
    
    let cardNumberLabel: UILabel = {
        $0.dropShadow()
        $0.textColor = AppColor.Text.foreground.color
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    let personNameLabel: UILabel = {
        $0.dropShadow()
        $0.textColor = AppColor.Text.foreground.color
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    let cardTypeLogoImageView: UIImageView = {
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIImageView())
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(brandLabel)
        addSubview(logoImageView)
        addSubview(cardNumberLabel)
        addSubview(personNameLabel)
        addSubview(cardTypeLogoImageView)
        
        NSLayoutConstraint.activate([
            brandLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            brandLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            cardNumberLabel.leadingAnchor.constraint(equalTo: personNameLabel.leadingAnchor, constant: 0),
            cardNumberLabel.bottomAnchor.constraint(equalTo: personNameLabel.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            personNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            personNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            cardTypeLogoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardTypeLogoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            cardTypeLogoImageView.widthAnchor.constraint(equalToConstant: 50),
            cardTypeLogoImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configure(with model: CardDetails) {
        brandLabel.text = model.cardInfo.brand.name
        logoImageView.image = model.cardInfo.brand.logo
        cardNumberLabel.text = model.cardInfo.number
        personNameLabel.text = model.customerInfo.firstName + " " + model.customerInfo.lastName
        cardTypeLogoImageView.image = model.cardInfo.type.logo
    }
}
