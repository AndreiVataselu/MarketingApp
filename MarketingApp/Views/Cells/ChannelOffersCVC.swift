//
//  ChannelOffersCVC.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 14/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import UIKit

class ChannelOffersCVC: UICollectionViewCell {
//    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    private var offer: Offer?
    
    func configure(offer: Offer) {
        self.offer = offer
//        priceLabel.text = "\(offer.price) €"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        tableView.reloadData()
    }
}

extension ChannelOffersCVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offer?.services.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseIndicatorTVC") as? ChooseIndicatorTVC else {
            return UITableViewCell()
        }
        
        cell.configureCell(indicatorName: offer?.services[indexPath.row] ?? "")
        return cell
    }
}
