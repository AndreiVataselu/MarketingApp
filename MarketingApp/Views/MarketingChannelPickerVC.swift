//
//  MarketingChannelPickerVC.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 14/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import UIKit

class MarketingChannelPickerVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var presenter: MarketingChannelPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCartButton()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        presenter = MarketingChannelPresenter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshCartButton()
    }
    
    private func addCartButton() {
        let cartButton = UIBarButtonItem(title: "Cos (\(presenter?.cart.count ?? 0))", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = cartButton
    }
    
    private func refreshCartButton() {
        navigationItem.rightBarButtonItem?.title = "Cos (\(presenter?.cart.count ?? 0))"
    }
}

extension MarketingChannelPickerVC: CartDelegate {
    func addToCart(item: CartItem) {
        presenter?.cart.append(item)
        refreshCartButton()
    }
}


extension MarketingChannelPickerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.channels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseMarketingChannelTVC") as? ChooseMarketingChannelTVC else {
            return UITableViewCell()
        }
        cell.configure(channelName: presenter?.channels[indexPath.row].name ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard presenter?.cart.filter({ $0.channelName == presenter?.channels[indexPath.row].name  }).isEmpty ?? false else {
            alert(title: "Eroare", message: "Poti alege doar un pachet pe fiecare canal!")
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
    
        let vc = SelectOfferVC.fromStoryboard()
        vc.marketingChannel = presenter?.channels[indexPath.row]
        vc.cartDelegate = self
        present(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
