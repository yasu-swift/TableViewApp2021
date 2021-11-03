//
//  TableViewController.swift
//  TableViewApp
//
//  Created by 高橋康之 on 2021/10/31.
//

import UIKit

class TableViewController: UITableViewController {
    var taskArray: [String] = []
    
    // 画面内に表示する名前を入れています。
    var names: [String] = [
        "阿部",
        "石田",
        "上田",
        "遠藤",
        "及川",
        "梶原",
        "菊池",
        "工藤",
        "高橋",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 繰り返し処理する
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard
        
        //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
        //tableViewを更新
        tableView.reloadData()
    }
    
    
    // スワイプ削除
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        taskArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(taskArray, forKey: "add")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // 今回はセクションは1つのみなので、namesの要素数をそのまま使います。
        // "変数名.count"で要素数を取得できます。
        return taskArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルのオブジェクトを作成します。
        // "NameCell" の部分はStoryboardでセルに設定したIdentifierを指定しています。
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        
        // namesから該当する行の文字列を取得してセルに設定します。
        // indexPath.rowで何行目かがわかります。
        cell.textLabel?.text = taskArray[indexPath.row]
        
        return cell
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true) //1つ前の画面に戻る
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
