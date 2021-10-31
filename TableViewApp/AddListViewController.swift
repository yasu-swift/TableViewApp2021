//
//  AddListViewController.swift
//  TableViewApp
//
//  Created by 高橋康之 on 2021/10/31.
//

import UIKit

class AddListViewController: UIViewController {
    
    @IBOutlet weak var addText: UITextField!
    var taskArray: [String] = [] //入力したリストを格納する配列
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる
        taskArray.append(addText.text!) //TextFieldで記入されたテキストを入れる
        userDefaults.set(taskArray, forKey: "add") //キー"add"で配列をUserDefaultsに保存
        self.navigationController?.popViewController(animated: true) //1つ前の画面に戻る
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
