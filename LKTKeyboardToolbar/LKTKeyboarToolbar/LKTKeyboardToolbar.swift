//
//  LKTKeyboardToolbar.swift
//  LKTKeyboardToolbar
//
//  Created by Liemkhiet Tran on 12/19/17.
//  Copyright © 2017 liem-khiet tran. All rights reserved.
//

import UIKit

class LKTKeyboardToolbar: UIToolbar {

  @objc var leftAction: (() -> Void)?
  @objc var rightAction: (() -> Void)?
  
  @objc required convenience init(leftButtonText: String?, rightButtonText: String?) {
    
    self.init(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
    createToolbar(leftButtonText: leftButtonText, rightButtonText: rightButtonText)
  }
  
  required override init(frame: CGRect) {
    
    super.init(frame: frame)
  }
  
  required init(coder aDecoder: NSCoder) {
    
    super.init(coder: aDecoder)!
  }
  
  func createToolbar(leftButtonText: String?, rightButtonText: String?) {
    
    self.barStyle = .default
    
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                    target: nil,
                                    action: nil)
    let button1 = UIBarButtonItem(title: leftButtonText,
                                  style: .done,
                                  target: self,
                                  action: #selector(leftButtonAction))
    let button2 = UIBarButtonItem(title: rightButtonText,
                                  style: .done,
                                  target: self,
                                  action: #selector(rightButtonAction))
    
    let items: [UIBarButtonItem] = [button1, flexSpace, button2]
    
    self.items = items
    sizeToFit()
  }
  
  @objc func leftButtonAction() {
    
    leftAction?()
  }
  
  @objc func rightButtonAction() {
    
    rightAction?()
  }
}
