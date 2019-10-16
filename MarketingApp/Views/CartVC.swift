//
//  CartVC.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 16/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation
import MessageUI
import UIKit

protocol RemoveFromCartDelegate: class {
    func removeFromCart(item: CartItem)
}

class CartVC: UIViewController {
    @IBOutlet private weak var totalPriceLabel: UILabel!
    @IBOutlet private weak var tableView: ResizingTableView!
    weak var cart: CartProtocol?
    
    private var oneItemInCart: Bool {
        return cart?.items.count == 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = tableView.visibleCells.count == cart?.items.count ?? 0
        tableView.maxHeight = 350
        
        refreshPrice()
    }
    
    private func generateMessage() -> String {
        var message = """
        Buna ziua,
        Detin o companie \(SessionManager.shared.companySize.rawValue) si va contactez in legatura cu o comanda in valoare de \(cart?.totalPrice ?? 0) euro pentru \(oneItemInCart ? "urmatoarea" : "urmatoarele") \(oneItemInCart ? "oferta" : "oferte"):\n
        """
        
        cart?.items.forEach {
            message.append("\n \($0.channelName): ")
            $0.offer.services.forEach { service in
                message.append("\n\t \(service)")
            }
            message.append("\n")
        }
        message.append("\nMultumesc frumos!")
        return message
    }
    
    private func refreshPrice() {
        totalPriceLabel.text = "\(cart?.totalPrice ?? 0) €"
    }
    
    @IBAction private func sendOrder() {
        guard (cart?.items.count ?? 0) > 0 else {
            alert(title: "Eroare!", message: "Nu ai nimic in cos!")
            return
        }
        
        guard MFMailComposeViewController.canSendMail() else {
            alert(title: "Eroare", message: "Inregistreaza-ti mailul pe telefon!")
            print(generateMessage())
            return
        }
        
        let mailComposerVC = MFMailComposeViewController()
       
        mailComposerVC.setToRecipients(["office@marketing.ro"])
        mailComposerVC.setSubject("Comanda pentru \(SessionManager.shared.companyName)")
        mailComposerVC.setMessageBody(generateMessage(), isHTML: false)
        
        present(mailComposerVC, animated: true)
    }
}

extension CartVC: RemoveFromCartDelegate {
    func removeFromCart(item: CartItem) {
        cart?.remove(item: item)
        tableView.reloadData()
        refreshPrice()
    }
    
}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTVC") as? CartTVC,
            let item = cart?.items[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(cartItem: item)
        cell.delegate = self
        return cell
    }
}
