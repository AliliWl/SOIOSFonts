//
//  DetailViewController.swift
//  SOIOSFonts
//
//  Created by wangli on 2017/3/6.
//  Copyright © 2017年 wangli. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate {
    public
    var fontName : String = ""
    
    @IBOutlet weak var uiTextField: UITextField!
    
    @IBOutlet weak var uiStepper: UIStepper!
    @IBOutlet weak var uiTextView: UITextView!
    @IBOutlet weak var uiFontSizeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTextView.font = UIFont.init(name: fontName, size: 20)
        uiFontSizeLabel.text = "Font size is " + "20"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onFontSizeChangeAction(_ sender: UIStepper) {
        
        uiTextView.font = UIFont.init(name: fontName, size: CGFloat(sender.value))
        uiFontSizeLabel.text = "Font size is " + String(Int(sender.value))
//        uiTextView.layoutIfNeeded()
//        uiTextView.setNeedsDisplay()
        uiTextView.setNeedsDisplay(CGRect(x: 15, y: 79, width: self.view.frame.size.width - 30, height: self.view.frame.size.height - 79 - 15))

    }
    @IBAction func onSubmitAction(_ sender: Any) {
        uiTextView.text = uiTextField.text
        uiTextField.resignFirstResponder()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        uiTextView.text = uiTextField.text! + string
        
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
