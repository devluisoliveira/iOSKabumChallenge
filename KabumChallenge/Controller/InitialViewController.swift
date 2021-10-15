//
//  InitialViewController.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 15/10/21.
//

import UIKit

class InitialViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .backgroundKabum
        navigationController?.setStatusBar(backgroundColor: .blueKabum)
    }
}
