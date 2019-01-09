//
//  ViewController.swift
//  eBangla
//
//  Created by Md Abu Sufian on 9/1/19.
//  Copyright © 2019 Md Abu Sufian. All rights reserved.
//

import UIKit
import FoldingCell

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cartButton: UIBarButtonItem!
    
    var isCart = false
    
    enum Const {
        static let closeCellHeight: CGFloat = 90
        static let openCellHeight: CGFloat = 450
    }
    
    var items = [Book]()
    
    var cellHeights: [CGFloat] = []
    
    class func getInstant() -> ViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        setup()
    }
    
    private func setup() {
        if !isCart {
            items = DataManager.manager.books
        } else {
            items = DataManager.manager.cart
        }
        cellHeights = Array(repeating: Const.closeCellHeight, count: items.count)
        tableView.estimatedRowHeight = Const.closeCellHeight
        tableView.rowHeight = UITableView.automaticDimension
        
        setCartButton()
    }
    
    func setCartButton() {
        if isCart {
            cartButton.tintColor = .clear
            title = "Cart"
        }
        cartButton.target = self
        cartButton.action = #selector(showCart(_:))
    }
    
    //MARK:- Button Action Methods
    
    @objc func addCurrentItemToCart(_ sender: UIButton) {
        let index = sender.tag - 1000
        if isCart {
            DataManager.manager.removeBookFromCart(index)
            items = DataManager.manager.cart
            tableView.reloadData()
            return
        }
        DataManager.manager.addBookToCart(index)
        
        showAlertWith(title: "Success", massage: "Add selected Book to cart")
    }
    
    @objc func showCart(_ sender: Any?) {
        let controller = ViewController.getInstant()
        controller.isCart = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK:- Helper Methods
    
    func showAlertWith(title: String?, massage: String?) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
        }))
        present(alert, animated: true, completion: nil)
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return items.count
    }
    
    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as ListTableViewCell = cell else {
            return
        }
        
        cell.backgroundColor = .clear
        
        if cellHeights[indexPath.row] == Const.closeCellHeight {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        
        let book = items[indexPath.row]
        
        cell.foregroundViewNameLablel.text = book.name
        cell.foregroundViewWriterLabel.text = book.writer
        cell.foregroundViewImageView.image = UIImage(named: book.coverImage)
        
        cell.containerViewNameLablel.text = book.name
        cell.containerViewWriterLabel.text = book.writer
        cell.containerViewImageView.image = UIImage(named: book.coverImage)
        
        cell.addToCartButton.tag = indexPath.row + 1000
        cell.addToCartButton.addTarget(self, action: #selector(addCurrentItemToCart(_:)), for: .touchUpInside)
        
        if isCart {
            cell.addToCartButton.setTitle("Remove", for: .normal)
        }
        
        return cell
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == Const.closeCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = Const.openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = Const.closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
}


