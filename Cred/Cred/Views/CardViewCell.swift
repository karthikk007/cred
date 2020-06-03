//
//  CardViewCell.swift
//  Cred
//
//  Created by Kumar, Karthik on 26/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

protocol CardViewCellDelegate: class {
    func shouldActivateOptions(sender: CardViewCell) -> Bool
    func leftActionItems(sender: CardViewCell) -> [ActionItem]?
    func rightActionItems(sender: CardViewCell) -> [ActionItem]?
}

class CardViewCell: UITableViewCell {
    
    static let identifier = "CardViewCell"
    
    weak var delegate: CardViewCellDelegate?
    
    let cardView: CardView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
       return $0
    }(CardView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        
        addSubview(cardView)
        
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        cardView.delegate = self
    }
    
    func configure(with model: CardDetails) {
        cardView.configure(with: model)
    }
    
    func resetCardPositionIfNeeded() {
        cardView.resetPositionIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cardView.prepareForReuse()
    }
    
    func isCardOptionsActive() -> Bool {
        if cardView.position != .center {
            return true
        }
        
        return false
    }
    
    func registerCardViewDelegate(with delegate: CardViewDelegate) {
        cardView.delegate = delegate
    }
    
    func simulate() {
        cardView.simulateSwipe()
    }
}

extension CardViewCell: CardViewDelegate {
    func shouldActivateOptions(sender: CardView) -> Bool {
        delegate?.shouldActivateOptions(sender: self) ?? false
    }
    
    func leftActionItems(sender: CardView) -> [ActionItem]? {
        delegate?.leftActionItems(sender: self)
    }
    
    func rightActionItems(sender: CardView) -> [ActionItem]? {
        delegate?.rightActionItems(sender: self)
    }
}
