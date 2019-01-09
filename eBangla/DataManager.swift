//
//  DataManager.swift
//  eBangla
//
//  Created by Md Abu Sufian on 9/1/19.
//  Copyright © 2019 Md Abu Sufian. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    static var manager = DataManager()
    
    var books = [Book]()
    var cart = [Book]()
    
    override private init() {
        super.init()
        makeDataArray()
    }
    
    private func makeDataArray() {
        books.append(Book(name: "Himu samagra (part-1)", writer: "Humayun Ahmed", coverImage: "1"))
        books.append(Book(name: "একাত্তরের চিঠি", writer: "Salauddin Ahmed", coverImage: "2"))
        books.append(Book(name: "পদ্মানদীর মাঝি", writer: "Manik Bandopadhyay", coverImage: "3"))
        books.append(Book(name: "মহেশ", writer: "Sarat Chandra Chattopadhyay", coverImage: "4"))
        books.append(Book(name: "ঢাকায় তিন গোয়েন্দা", writer: "Rakib Hassan", coverImage: "5"))
        books.append(Book(name: "Himu samagra (part-1)", writer: "Humayun Ahmed", coverImage: "1"))
        books.append(Book(name: "একাত্তরের চিঠি", writer: "Salauddin Ahmed", coverImage: "2"))
        books.append(Book(name: "পদ্মানদীর মাঝি", writer: "Manik Bandopadhyay", coverImage: "3"))
        books.append(Book(name: "মহেশ", writer: "Sarat Chandra Chattopadhyay", coverImage: "4"))
        books.append(Book(name: "ঢাকায় তিন গোয়েন্দা", writer: "Rakib Hassan", coverImage: "5"))
        books.append(Book(name: "Himu samagra (part-1)", writer: "Humayun Ahmed", coverImage: "1"))
        books.append(Book(name: "একাত্তরের চিঠি", writer: "Salauddin Ahmed", coverImage: "2"))
        books.append(Book(name: "পদ্মানদীর মাঝি", writer: "Manik Bandopadhyay", coverImage: "3"))
        books.append(Book(name: "মহেশ", writer: "Sarat Chandra Chattopadhyay", coverImage: "4"))
        books.append(Book(name: "ঢাকায় তিন গোয়েন্দা", writer: "Rakib Hassan", coverImage: "5"))
        books.append(Book(name: "Himu samagra (part-1)", writer: "Humayun Ahmed", coverImage: "1"))
        books.append(Book(name: "একাত্তরের চিঠি", writer: "Salauddin Ahmed", coverImage: "2"))
        books.append(Book(name: "পদ্মানদীর মাঝি", writer: "Manik Bandopadhyay", coverImage: "3"))
        books.append(Book(name: "মহেশ", writer: "Sarat Chandra Chattopadhyay", coverImage: "4"))
        books.append(Book(name: "ঢাকায় তিন গোয়েন্দা", writer: "Rakib Hassan", coverImage: "5"))
       
    }
    
    func addBookToCart(_ index: Int) {
        let book = books[index]
        cart.append(book)
    }
    
    func removeBookFromCart(_ index: Int) {
        cart.remove(at: index)
    }
}
