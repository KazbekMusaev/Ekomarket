//
//  Extension.swift
//  DagorMarket
//
//  Created by apple on 22.01.2024.
//

import Foundation


extension ViewController: HeaderDelegate {
    func didTupToAllBtn() {
        let vc = AllComponents()
        navigationController?.pushViewController(vc, animated: true)
    }
}

