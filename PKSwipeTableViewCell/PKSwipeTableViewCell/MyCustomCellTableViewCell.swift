//
//  MyCustomCellTableViewCell.swift
//  PKSwipeTableViewCell
//
//  Created by Pradeep Kumar Yadav on 16/04/16.
//  Copyright © 2016 iosbucket. All rights reserved.
//

import UIKit

class MyCustomCellTableViewCell: PKSwipeTableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addRightViewInCell()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(strToSet:String) {
        self.lblTitle.text = strToSet
    }
    
    func addRightViewInCell() {
        
        //Create a view that will display when user swipe the cell in right
        let viewCall = UIView()
        viewCall.backgroundColor = UIColor.lightGrayColor()
        viewCall.frame = CGRectMake(0, 0,CGRectGetHeight(self.frame)+20,CGRectGetHeight(self.frame))
        //Add a label to display the call text
        let lblCall = UILabel()
        lblCall.text  = "Call"
        lblCall.font = UIFont.systemFontOfSize(15.0)
        lblCall.textColor = UIColor.yellowColor()
        lblCall.textAlignment = NSTextAlignment.Center
        lblCall.frame = CGRectMake(0,CGRectGetHeight(self.frame) - 20,viewCall.frame.size.width,20)
        //Add a button to perform the action when user will tap on call and add a image to display
        let btnCall = UIButton(type: UIButtonType.Custom)
        btnCall.frame = CGRectMake((viewCall.frame.size.width - 40)/2,5,40,40)
        btnCall.setImage(UIImage(named: "call"), forState: UIControlState.Normal)
        btnCall.addTarget(self, action: "callButtonClicked", forControlEvents: UIControlEvents.TouchUpInside)

        viewCall.addSubview(btnCall)
        viewCall.addSubview(lblCall)
        //Call the super addRightOptions to set the view that will display while swiping
        super.addRightOptionsView(viewCall)
    }
    
    
    func callButtonClicked(){
        //Reset the cell state and close the swipe action
        self.resetCellState()
    }

}
