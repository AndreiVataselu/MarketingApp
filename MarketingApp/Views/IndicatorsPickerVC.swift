//
//  IndicatorsPickerVC.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 12/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation
import UIKit

class IndicatorsPickerVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var nextButton: UIButton!
    private var presenter: IndicatorsPickerPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        presenter = IndicatorsPickerPresenter()
    }
    
    private func performCellSelection(indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ChooseIndicatorTVC else {
            return
        }
        cell.selectedCell()
    }
}

extension IndicatorsPickerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.indicators.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseIndicatorTVC") as? ChooseIndicatorTVC else {
            return UITableViewCell()
        }
        cell.configureCell(indicatorName: presenter?.indicators[indexPath.row].rawValue ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performCellSelection(indexPath: indexPath)
        presenter?.indicatorSelected(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performCellSelection(indexPath: indexPath)
        presenter?.indicatorDeselected(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel(frame: view.bounds)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        label.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 15).isActive = true
        label.text = "Alege criteriile pentru campania ta de marketing"
        label.font = .systemFont(ofSize: 30, weight: .thin)
        label.textColor = .black
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
}
