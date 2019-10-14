//
//  SelectOfferVC.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 14/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation
import UIKit

class SelectOfferVC: UIViewController {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    var marketingChannel: MarketingChannel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = true
        collectionView.alwaysBounceHorizontal = true
        nameLabel.text = marketingChannel?.name ?? ""
    }
    
    private func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 500)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
}


extension SelectOfferVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return marketingChannel?.packages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelOffersCVC", for: indexPath) as? ChannelOffersCVC,
            let offer = marketingChannel?.packages[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.configure(offer: offer)
        return cell
    }
    
    
}
