//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by GIGL iOS on 21/05/2022.
//

import UIKit
import RxSwift
import RxCocoa

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
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
    }
    
    func bindTableData() {
        // Bind items to table
        viewModel.items.bind(
            to: tableView.rx.items(
                cellIdentifier: "cell",
                cellType: UITableViewCell.self))
        { row, model, cell in
            cell.textLabel?.text = model.imageTitle
            cell.imageView?.image = UIImage(systemName: model.imageName)
            cell.selectionStyle = .none
        }.disposed(by: bag)
        
        // Bind a model selected handler
        tableView.rx.modelSelected(Product.self).bind { product in
            print(product.imageTitle)
        }.disposed(by: bag)
        
        // fetch items
        viewModel.fetchItems()
    }
}

