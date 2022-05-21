//
//  ProjectViewModel.swift
//  RxSwiftPractice
//
//  Created by GIGL iOS on 21/05/2022.
//

import Foundation
import RxSwift

struct ProductViewModel {
    var items = PublishSubject<[Product]>()
    
    func fetchItems() {
        let products = [
            Product(imageName: "house", imageTitle: "Home"),
            Product(imageName: "gear", imageTitle: "Settings"),
            Product(imageName: "person.circle", imageTitle: "Profile"),
            Product(imageName: "airplane", imageTitle: "Flights"),
            Product(imageName: "bell", imageTitle: "Notification")
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
}
