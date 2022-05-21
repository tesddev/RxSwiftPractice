//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by GIGL iOS on 21/05/2022.
//

import UIKit
import RxSwift
import RxCocoa

struct Product {
    let imageName: String
    let imageTitle: String
}

struct ProductViewModel {
    var items = PublishSubject<[Product]>()
    
    func fetchItems() {
        let products = [
            Product(imageName: "house", imageTitle: "Home"),
            Product(imageName: "gear", imageTitle: "Settings"),
            Product(imageName: "person.circle", imageTitle: "Profile"),
            Product(imageName: "airplane ", imageTitle: "Flights"),
            Product(imageName: "bell", imageTitle: "Notification")
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var viewModel = ProductViewModel()
    
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

