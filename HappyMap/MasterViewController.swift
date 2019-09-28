//
//  MasterViewController.swift
//  HappyMap
//
//  Created by Linda_Chen on 2019/9/21.
//  Copyright © 2019 Linda_Chen. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    let names : [String] = ["A", "B", "C"]
    
    var selectedName : String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = names[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PositionCell") as! PositionCell
        
        cell.updateContent(name: name)
        
        return cell
    
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        selectedName = names[indexPath.row]
        
        print("第\(row)要被選中, 其值為:\(selectedName)")
        
        performSegue(withIdentifier: "moveToDetailSegue", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "moveToDetailSegue":
            let dest = segue.destination as!
            DetalViewController
            
            dest.傳入值 = self.selectedName
            break
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
