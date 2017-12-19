//
//  ViewController.swift
//  LKTKeyboardToolbar
//
//  Created by Liemkhiet Tran on 12/19/17.
//  Copyright © 2017 liem-khiet tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

// MARK:- ---> UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    // return NO to disallow editing.
    print("TextField should begin editing method called")
    return true
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    // became first responder
    print("TextField did begin editing method called")
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    print("TextField should snd editing method called")
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    print("TextField did end editing method called")
  }
  
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    // if implemented, called in place of textFieldDidEndEditing:
    print("TextField did end editing with reason method called")
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    // return NO to not change text
    print("While entering the characters this method gets called")
    return true
  }
  
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    // called when clear button pressed. return NO to ignore (no notifications)
    print("TextField should clear method called")
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // called when 'return' key pressed. return NO to ignore.
    print("TextField should return method called")
    // may be useful: textField.resignFirstResponder()
    return true
  }
  
}
