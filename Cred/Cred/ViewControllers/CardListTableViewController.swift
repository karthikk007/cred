//
//  CardListTableViewController.swift
//  Cred
//
//  Created by Kumar, Karthik on 26/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

class CardListTableViewController: UITableViewController {
    
    var cardListModel = CardListModel()
    
    lazy var addButton: UIButton = {
        $0.setTitle("+ Add New", for: .normal)
        
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = AppColor.Button.background.color
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.setTitleColor(AppColor.Button.foreground.color, for: .normal)
        
        $0.addTarget(self, action: #selector(didTapAddNew(sender:)), for: .touchUpInside)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTableView()
        setupNavigationBar()
        setupNavigationBarViews()
                
        view.backgroundColor = AppColor.ViewController.background.color
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let cell = tableView.visibleCells.first as? CardViewCell {
            cell.simulate()
        }
    }
    
    private func setupNavigationBarViews() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.addSubview(addButton)

        
        NSLayoutConstraint.activate([
            addButton.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -10),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setupTableView() {
        tableView.tableFooterView = UIView()
                
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        
        tableView.register(CardViewCell.self, forCellReuseIdentifier: CardViewCell.identifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardListModel.cards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CardViewCell.identifier) as? CardViewCell {
            cell.configure(with: cardListModel.cards[indexPath.row])
            cell.delegate = self
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableView.visibleCells.forEach { (cell) in
            if let cell = cell as? CardViewCell {
                cell.resetCardPositionIfNeeded()
            }
        }
    }

    func showAlert(title: String, message: String) {
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel) { (action) in
            
        }
        
        controller.addAction(action)
        
        self.present(controller, animated: true) {
            
        }
    }
    
    @objc
    func didTapAddNew(sender: UIButton) {
        showAlert(title: "Add New", message: "You have tapped Add New")
    }
}

extension CardListTableViewController: NavigationBarCustomizable {
    var navigationTitle: String {
        return "cards"
    }
}

extension CardListTableViewController: CardViewCellDelegate {
    func shouldActivateOptions(sender: CardViewCell) -> Bool {
        var shouldActivate: Bool = true
        
        tableView.visibleCells.forEach { (cell) in
            if let cell = cell as? CardViewCell {
                if cell.isCardOptionsActive() {
                    shouldActivate = false
                }
            }
        }
        
        return shouldActivate
    }
    
    // below options are for debugging purpose
    // please dont review
    func leftActionItems(sender: CardViewCell) -> [ActionItem]? {
        if let indexPath = tableView.indexPath(for: sender) {
            let cardInfo = cardListModel.cards[indexPath.row]
            let name = cardInfo.customerInfo.firstName + " " + cardInfo.customerInfo.lastName
            
            if indexPath.row % 2 == 0 {
                return [
                    ActionItem(action: .checkBalance, completionBlock: {
                        self.showAlert(title: "check balance", message: "\(name) check balance")
                    }),
                    ActionItem(action: .viewDetails, completionBlock: {
                        self.showAlert(title: "view details", message: "\(name) view details")
                    })
                ]
            }
            
            return [
                ActionItem(action: .payNow, completionBlock: {
                    self.showAlert(title: "pay now", message: "\(name) pay now")
                }),
                ActionItem(action: .makeTransaction, completionBlock: {
                    self.showAlert(title: "make transaction", message: "\(name) make transaction")
                }),
                ActionItem(action: .checkBalance, completionBlock: {
                    self.showAlert(title: "check balance", message: "\(name) check balance")
                }),
                ActionItem(action: .viewDetails, completionBlock: {
                    self.showAlert(title: "view details", message: "\(name) view details")
                }),
            ]
        } else {
            return nil
        }
    }
    
    // below options are for debugging purpose
    // please dont review
    func rightActionItems(sender: CardViewCell) -> [ActionItem]? {
        if let indexPath = tableView.indexPath(for: sender) {
            let cardInfo = cardListModel.cards[indexPath.row]
            let name = cardInfo.customerInfo.firstName + " " + cardInfo.customerInfo.lastName
            
            if indexPath.row % 2 == 0 {
                return [
                    ActionItem(action: .payNow, completionBlock: {
                        self.showAlert(title: "pay now", message: "\(name) pay now")
                    }),
                    ActionItem(action: .makeTransaction, completionBlock: {
                        self.showAlert(title: "make transaction", message: "\(name) make transaction")
                    })
                ]
            }
            
            return [
                ActionItem(action: .payNow, completionBlock: {
                    self.showAlert(title: "pay now", message: "\(name) pay now")
                }),
                ActionItem(action: .makeTransaction, completionBlock: {
                    self.showAlert(title: "make transaction", message: "\(name) make transaction")
                }),
                ActionItem(action: .checkBalance, completionBlock: {
                    self.showAlert(title: "check balance", message: "\(name) check balance")
                }),
                ActionItem(action: .viewDetails, completionBlock: {
                    self.showAlert(title: "view details", message: "\(name) view details")
                }),
            ]
        } else {
            return nil
        }
    }
}

