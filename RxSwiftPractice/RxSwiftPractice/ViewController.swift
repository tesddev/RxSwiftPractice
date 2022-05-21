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
        
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

