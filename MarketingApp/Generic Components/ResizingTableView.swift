//
//  ResizingTableView.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 17/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation
import UIKit

class ResizingTableView: UITableView {
  var maxHeight: CGFloat = 350
  
  override func reloadData() {
    super.reloadData()
    self.invalidateIntrinsicContentSize()
    self.layoutIfNeeded()
  }
  
  override var intrinsicContentSize: CGSize {
    let height = min(contentSize.height, maxHeight)
    return CGSize(width: contentSize.width, height: height)
  }
}
