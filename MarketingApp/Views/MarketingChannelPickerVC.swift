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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        presenter = MarketingChannelPresenter()
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
        let vc = SelectOfferVC.fromStoryboard()
        vc.marketingChannel = presenter?.channels[indexPath.row]
        present(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
