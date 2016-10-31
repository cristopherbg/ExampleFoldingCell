//
//  MainTableViewController.swift
//  FoldingCell
//
//  Created by Cristopher A. Bautista Gómez on 10/31/16.
//  Copyright © 2016 Cristopher A. Bautista Gómez. All rights reserved.
//


import UIKit
import FoldingCell

class MainTableViewController: UITableViewController {
    
    let kCloseCellHeight: CGFloat = 179
    let kOpenCellHeight: CGFloat = 488

    let kRowsCount = 3
    
    var cellHeights = [CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCellHeightsArray()
        
    }
    
    // MARK: configure
    func createCellHeightsArray() {
        for _ in 0...kRowsCount {
            cellHeights.append(kCloseCellHeight)
        }
    }
}

// MARK: - Table view data source
extension MainTableViewController{


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kRowsCount
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      
      guard case let cell as DemoCell = cell else {
        return
      }
      
      cell.backgroundColor = UIColor.clear
      
      if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight {
        cell.selectedAnimation(false, animated: false, completion:nil)
      } else {
        cell.selectedAnimation(true, animated: false, completion: nil)
      }
      
      //cell.number = indexPath.row
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[(indexPath as NSIndexPath).row]
    }
}

// MARK: Table vie delegate
extension MainTableViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight { // open cell
            cellHeights[(indexPath as NSIndexPath).row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[(indexPath as NSIndexPath).row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)        
    }
}
