//
//  DetailViewController.swift
//  SideDishApp
//
//  Created by delma on 2020/04/26.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK:- properties
    var menuHash = ""
    private var menuDetail: MenuDetail?
    private var detailView = MenuDetailView()
    
    //MARK:- functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUsecase(menuHash)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view.addSubview(detailView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        detailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        detailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        detailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func configureUsecase(_ menuHash: String) {
        NetworkUseCase.makeMenuDetail(with: MenuViewController.networkManager, menuHash: menuHash) { data in
            self.menuDetail = data
            DispatchQueue.main.async {
                guard let menuDetail = self.menuDetail else { return }
                self.detailView.configureData(menuDetail)
            }
        }
    }
    
  
    
    @objc func pressOrderButton(button: UIButton) {
        let noStockAlert = makeAlert(title: "재고없음", message: "재고가 없어 주문이 취소되었습니다", insideAlert: nil) {
            self.navigationController?.popViewController(animated: true)
        }
        let defaultAlert = makeAlert(title: "주문", message: "주문하시겠습니까?", insideAlert: noStockAlert) { }
        present(defaultAlert, animated: true)
    }
    
    private func makeAlert(title: String, message: String, insideAlert: UIAlertController?, handler: @escaping () -> ()) -> UIAlertController {
        let defaultAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "네", style: .default) { ok in
            if let alert = insideAlert { self.present(alert, animated: true) }
            handler()
        }
        let cancel = UIAlertAction(title: "아니오", style: .cancel)
        
        defaultAlert.addAction(ok)
        defaultAlert.addAction(cancel)
        return defaultAlert
    }
}
