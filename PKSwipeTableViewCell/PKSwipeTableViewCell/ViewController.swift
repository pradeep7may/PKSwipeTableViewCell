//
//  ViewController.swift
//  PKSwipeTableViewCell
//
//  Created by Pradeep Kumar Yadav on 16/04/16.
//  Copyright © 2016 iosbucket. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,PKSwipeCellDelegateProtocol {

    let arrDataToDisplay:Array<String> = ["Swipe Me","Swipe Me","Swipe Me","Swipe Me","Swipe Me"]
    private var oldStoredCell:PKSwipeTableViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TableViewDataSource Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrDataToDisplay.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell") as! MyCustomCellTableViewCell
        cell.delegate = self
        cell.configureCell(self.arrDataToDisplay[indexPath.row])
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
        
    }
    
    // MARK: - tableView Delegate method
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    //MARK: PKSwipeTableViewCell Delegate
    func swipeBeginInCell(cell: PKSwipeTableViewCell) {
        oldStoredCell = cell
    }
    
    func swipeDoneOnPreviousCell() -> PKSwipeTableViewCell? {
        guard let cell = oldStoredCell else {
            return nil
        }
        return cell
    }

}

