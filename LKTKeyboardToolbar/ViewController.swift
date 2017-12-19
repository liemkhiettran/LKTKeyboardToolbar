//
//  ViewController.swift
//  LKTKeyboardToolbar
//
//  Created by Liemkhiet Tran on 12/19/17.
//  Copyright © 2017 liem-khiet tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    addTextField()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func addTextField() {
    
    let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 280, height: 44))
    sampleTextField.placeholder = "Enter text here"
    sampleTextField.font = UIFont.systemFont(ofSize: 15)
    sampleTextField.borderStyle = UITextBorderStyle.roundedRect
    sampleTextField.autocorrectionType = UITextAutocorrectionType.no
    sampleTextField.keyboardType = UIKeyboardType.default
    sampleTextField.returnKeyType = UIReturnKeyType.done
    sampleTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
    sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
    sampleTextField.delegate = self
    self.view.addSubview(sampleTextField)
    
    addToolbarTo(sampleTextField)
  }
  
  func addToolbarTo(_ textField: UITextField) {
    
    let toolbar = LKTKeyboardToolbar(leftButtonText: nil,
                                     rightButtonText: "Done")
    toolbar.rightAction = {() -> Void in
      
      self.view.endEditing(true)
    }
    
    textField.inputAccessoryView = toolbar
  }
}

