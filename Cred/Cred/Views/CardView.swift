//
//  CardView.swift
//  Cred
//
//  Created by Kumar, Karthik on 26/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

protocol CardViewDelegate: class {
    func shouldActivateOptions(sender: CardView) -> Bool
    func leftActionItems(sender: CardView) -> [ActionItem]?
    func rightActionItems(sender: CardView) -> [ActionItem]?
}

class CardView: UIView {
    
    var position: CardPosition = .center
    
    private var panStartPoint: CGPoint = .zero
    private var isActionItemsPrepared = false
    
    weak var delegate: CardViewDelegate?
    
    let cardActionsView: CardBackgroundView = {
        $0.roundedCorners()
        $0.backgroundColor = AppColor.CardView.background.color
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(CardBackgroundView())
    
    let cardForegroundView: CardForegroundView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(CardForegroundView())
    
    lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        $0.cancelsTouchesInView = false
        $0.delaysTouchesBegan = true
        $0.delegate = self
        
        return $0
    }(UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:))))
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        dropShadow()
        cardForegroundView.dropShadow()
    }
    
    private func setupViews() {
        addGestureRecognizer(panGestureRecognizer)
        
        addSubview(cardActionsView)
        
        NSLayoutConstraint.activate([
            cardActionsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardActionsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardActionsView.topAnchor.constraint(equalTo: topAnchor),
            cardActionsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(cardForegroundView)
        
        NSLayoutConstraint.activate([
            cardForegroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardForegroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardForegroundView.topAnchor.constraint(equalTo: topAnchor),
            cardForegroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    func configure(with model: CardDetails) {
        cardForegroundView.backgroundColor = model.cardInfo.brand.color
        
        cardForegroundView.configure(with: model)
    }
    
    func prepareForReuse() {
        position = .center
        cardForegroundView.transform = .identity
        
        cardActionsView.setLeftActionItems(with: nil)
        cardActionsView.setRightActionItems(with: nil)
        
        isActionItemsPrepared = false
    }
    
    func resetPositionIfNeeded() {
        guard position != .center else {
            return
        }
        
        position = .center
        
        let alphaComponent = position.alphaComponent
        UIView.animate(withDuration: 0.5) {
            self.cardForegroundView.transform = .identity
            self.cardActionsView.leftActionsView.alpha = alphaComponent.left
            self.cardActionsView.rightActionsView.alpha = alphaComponent.right
        }
    }
    
    private func prepareOptionsIfNeeded() {
        if !isActionItemsPrepared {
            isActionItemsPrepared = true
                    
            cardActionsView.setLeftActionItems(with: delegate?.leftActionItems(sender: self) ?? nil)
            cardActionsView.setRightActionItems(with: delegate?.rightActionItems(sender: self) ?? nil)
        }
    }
    
    func simulateSwipe() {
        prepareOptionsIfNeeded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let deltaX: CGFloat = CardPosition.left.offset
            
            UIView.animate(withDuration: 0.5) {
                self.cardForegroundView.transform = CGAffineTransform(translationX: self.position.offset + deltaX, y: 0)
                self.cardActionsView.leftActionsView.alpha = (self.position.offset + deltaX) / 200
                self.cardActionsView.rightActionsView.alpha = -(self.position.offset + deltaX) / 200
            }
                        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                
                UIView.animate(withDuration: 0.5) {
                    self.cardForegroundView.transform = .identity
                }
            }
        }
    }
    
    @objc
    func didPan(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            panStartPoint = sender.translation(in: superview)
            
            prepareOptionsIfNeeded()
            
        case .changed:
            let currentPoint = sender.translation(in: superview)
            let deltaX = currentPoint.x - panStartPoint.x
            
            UIView.animate(withDuration: 0.5) {
                self.cardForegroundView.transform = CGAffineTransform(translationX: self.position.offset + deltaX, y: 0)
                self.cardActionsView.leftActionsView.alpha = (self.position.offset + deltaX) / CardPosition.maxDisplacement
                self.cardActionsView.rightActionsView.alpha = -(self.position.offset + deltaX) / CardPosition.maxDisplacement
            }
            
        case .ended:
            let currentPoint = sender.translation(in: self)
            let deltaX = currentPoint.x - panStartPoint.x
            
            var finalPosition = position.offset
            
            switch position {
            case .center:
                if abs(deltaX) > 100 {
                    position.transform(for: deltaX)
                }
                
                finalPosition = position.offset
                
            case .left:
                position.transform(for: deltaX)
                
                finalPosition = position.offset
                
            case .right:
                position.transform(for: deltaX)
                
                finalPosition = position.offset
            }
                        
            let alphaComponent = position.alphaComponent
            
            UIView.animate(withDuration: 0.5) {
                self.cardForegroundView.transform = CGAffineTransform(translationX: finalPosition, y: 0)
                self.cardActionsView.leftActionsView.alpha = alphaComponent.left
                self.cardActionsView.rightActionsView.alpha = alphaComponent.right
            }
            
        case .cancelled:
            UIView.animate(withDuration: 0.5) {
                self.cardForegroundView.transform = .identity
            }
            
        default:
            break
            
        }
    }
}

extension CardView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let delegate = delegate, delegate.shouldActivateOptions(sender: self) || position != .center {
            
            if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
                let translation = panGestureRecognizer.translation(in: superview)
                if abs(translation.x) > abs(translation.y) {
                    return true
                }
                
                return false
            }
        }
        return false
    }
}

extension CardView {
    enum CardPosition: Int {
        case center
        case left
        case right
        
        static let maxDisplacement: CGFloat = 200
        
        static let minDeltaChange: CGFloat = 50
        
        var offset: CGFloat {
            switch self {
            case .center:
                return 0
            case .left:
                return -CardPosition.maxDisplacement
            case .right:
                return CardPosition.maxDisplacement
            }
        }
        
        mutating func transform(for delta: CGFloat) {
            if abs(delta) > CardPosition.minDeltaChange {
                if self == .center {
                    self = delta > 0 ? .right : .left
                } else {
                    switch self {
                    case .left:
                        if delta > 0 {
                            self = .center
                        }
                        
                    case .right:
                        if delta < 0 {
                            self = .center
                        }
                    default:
                        break
                    }
                    
                }
            }
        }
        
        var alphaComponent: (left: CGFloat, right: CGFloat) {
            switch self {
            case .center:
                return (0, 0)
            case .left:
                return (0, 1)
            case .right:
                return (1, 0)
            }
        }
    }
}
