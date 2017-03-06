//
//  ViewController.swift
//  SOIOSFonts
//
//  Created by wangli on 2017/3/6.
//  Copyright © 2017年 wangli. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private
    let familyFont : Array = receiveSystemFonts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let uiTableView : UITableView = UITableView.init(frame: self.view.frame, style: .plain)
        uiTableView.delegate = self
        uiTableView.dataSource = self
        self.view.addSubview(uiTableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyFont.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentify = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellIdentify)
        }
        let familyName : String = familyFont[indexPath.row]
        cell?.textLabel?.font = UIFont.init(name: familyName, size: 18)
        cell?.textLabel?.text = familyName
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController : DetailViewController = DetailViewController.init(nibName: "DetailViewController", bundle: nil)
        detailViewController.fontName = familyFont[indexPath.row]
        self.present(detailViewController, animated: true) { 
            
        }
    }
}

