//
//  UICityPicker.swift
//  UICityPicker
//
//  Created by ding_qili on 16/11/25.
//  Copyright © 2016年 ding_qili. All rights reserved.
//

import UIKit

open class UICityPicker: NSObject {
    open func presentCityPicker(viewController:UIViewController) -> UICityPickerView{
        //init city picker
        let datePicker = UICityPickerView(frame: CGRect(x: 0, y: 0, width: viewController.view.frame.size.width,height: 260))
        
        //add to actionsheetview
        let alertController = UIAlertController(title: "", message:"" , preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alertController.view.addSubview(datePicker)//add subview
        
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler: nil);
        //add button to action sheet
        alertController.addAction(cancelAction)
        
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 300)
        alertController.view.addConstraint(height);
        
        viewController.present(alertController, animated: true, completion: nil)
        
        return datePicker;
    }
    
}
