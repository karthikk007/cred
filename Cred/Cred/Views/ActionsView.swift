//
//  SwipeActionsView.swift
//  Cred
//
//  Created by Kumar, Karthik on 27/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

class CardActionsView: UIView {
    
    var actionItems: [ActionItem]? {
        didSet {
            setupContainterStackView()
        }
    }
    
    let containerStackView: UIStackView = {
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.alignment = .center
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIStackView())
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        containerStackView.backgroundColor = .red
        
        setupContainterStackView()
    }
    
    private func setupContainterStackView() {
        containerStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        if let actionItems = actionItems {
            for item in actionItems {
                let view = ActionItemView()
                view.configure(with: item)
                
                containerStackView.addArrangedSubview(view)
                view.widthAnchor.constraint(equalTo: containerStackView.widthAnchor).isActive = true
                
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapActionItem(sender:)))
                view.addGestureRecognizer(tapGestureRecognizer)
            }
        }
    }
    
    @objc
    func didTapActionItem(sender: UITapGestureRecognizer) {
        if let view = sender.view as? ActionItemView {
            UIView.animate(withDuration: 0.2, animations: {
                view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }) { (finished) in
                UIView.animate(withDuration: 0.2, animations: {
                    view.transform = .identity
                })
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                view.actionItem?.completionBlock()
            }
        }
    }
}

struct ActionItem {
    let action: CardActionsView.CardActions
    let completionBlock: (() -> ())
}

extension CardActionsView {
    enum CardActions {
        case payNow
        case viewDetails
        case makeTransaction
        case checkBalance
        
        var title: String {
            switch self {
            case .payNow:
                return "Pay Now"
            case .viewDetails:
                return "View Details"
            case .makeTransaction:
                return "Make Transaction"
            case .checkBalance:
                return "Check Balance"
            }
        }
        
        var logo: UIImage? {
            switch self {
            case .payNow:
                return UIImage(named: "paynow")
            case .viewDetails:
                return UIImage(named: "view-details")
            case .makeTransaction:
                return UIImage(named: "make-transaction")
            case .checkBalance:
                return UIImage(named: "check-balance")
            }
        }
    }
}
