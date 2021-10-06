//
//  MainViewController.swift
//  InstagramCloneCoding
//
//  Created by 이강욱 on 2021/10/02.
//

import Foundation
import UIKit
import SnapKit
class MainViewController: UIViewController {
    
    var dataSource: [String] = []
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 20
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        return view
    }()
    lazy var tableView = UITableView()
    
    private func setupDataSource() {
        for i in 1...10 {
            dataSource.append(String(i))
        }
    }
    
    private func addSubviews() {
        view.addSubview(collectionView)
        view.addSubview(tableView)
    }
    
    private func registerCell() {
        collectionView.register(StoriesCell.self, forCellWithReuseIdentifier: StoriesCell.id)
        tableView.register(FeedsCell.self, forCellReuseIdentifier: "FeedsCell")
    }
    
    private func configure() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        tableView.snp.makeConstraints{ make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.collectionView.snp.bottom)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        addSubviews()
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
        configure()
        
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCell.id, for: indexPath)
        if let cell = cell as? StoriesCell {
            cell.model = dataSource[indexPath.item]
        }

        return cell
    }
    
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedsCell")!
        return cell
    }
    
    
}
