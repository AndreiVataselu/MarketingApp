//
//  SelectOfferVC.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 14/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation
import UIKit

protocol CartDelegate: class {
    func addToCart(offer: Offer)
}

class SelectOfferVC: UIViewController {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var priceLabel: UILabel!
    
    private var currentIndex: Int = -1
    var marketingChannel: MarketingChannel?
    weak var cartDelegate: CartDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePrice(for: 0)
        configureLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.isPagingEnabled = true
        nameLabel.text = marketingChannel?.name ?? ""
    }
    
    private func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.decelerationRate = .fast
    }
    
    @IBAction private func addToCartButtonPressed(_ sender: UIButton) {
        guard let selectedOffer = marketingChannel?.packages[currentIndex] else {
            return
        }
        cartDelegate?.addToCart(offer: selectedOffer)
        dismiss(animated: true, completion: nil)
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
    
    private func updatePrice(for index: Int) {
        guard index != currentIndex else {
            return
        }
        
        currentIndex = index
        
        priceLabel.text = "\(marketingChannel?.packages[currentIndex].price ?? 0)"
    }
}

extension SelectOfferVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Width of a collection view cell is the same as the collection view's width
        // quick maths
        let currentIndex = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        updatePrice(for: currentIndex)
    }
}
