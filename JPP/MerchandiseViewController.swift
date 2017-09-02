//
//  MerchandiseViewController.swift
//  JPP
//
//  Created by Harsh Thakkar on 04/07/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class MerchandiseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var merchandiseView = Merchandise()
    var merchandiseJSON: JSON = []
    @IBOutlet weak var merchandiseTable: UITableView!
    @IBOutlet weak var merchandiseKit: UIImageView!
    @IBOutlet weak var merchandiseText: UIImageView!
//    @IBOutlet weak var merchandiseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("MERCHANDISE")
        loadingInit()
        self.view.addSubview(loaderGlo)
//         let merchandiseView = Merchandise(frame: CGRect(x: 8, y: 16, width: self.view.frame.size.width - 16, height: 77))
//        view.addSubview(merchandiseView)
        rest.merchandise({(json:JSON) -> () in
            DispatchQueue.main.sync(execute: {
                if json == 401 {
                    print("No Data Found")
                }else{
                    
                   
                    self.merchandiseJSON = json
                    
                    print("merchandise\(self.merchandiseJSON)")
                    print("getMeCount\(self.merchandiseJSON["queryresult"].count)")
                    DispatchQueue.main.async(execute: {
                        self.merchandiseTable.reloadData()
                    });
                    
                    DispatchQueue.main.async(execute: {
                        loadingStop()
                    });
                    
                   
                }
               
            })
           

        })

        
//        merchandiseKit.layer.zPosition = 10000
        merchandiseText.layer.zPosition = 10000
//        merchandiseButton.layer.zPosition = 10000
        
        
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return merchandiseJSON["queryresult"].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
//        tableView.rowHeight = 440.0
//        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
//        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "merchandise", for: indexPath) as! merchandiseTable
        cell.selectionStyle = UITableViewCellSelectionStyle.none
       
        cell.productImage.hnk_setImageFromURL(rest.getImageSizeCache(self.merchandiseJSON["queryresult"][indexPath.row]["image"].stringValue))
        cell.productName.text = merchandiseJSON["queryresult"][indexPath.row]["name"].stringValue
        cell.productPrice.text = "₹ " + merchandiseJSON["queryresult"][indexPath.row]["price"].stringValue
        cell.buyNow.addTarget(self, action: #selector(MerchandiseViewController.productLink(_:)), for: .touchUpInside)
        cell.buyNow.tag =  indexPath.row
        
        return cell
    }
    
    func productLink(_ sender: UIButton){
        let WebController =
            self.storyboard?.instantiateViewController(withIdentifier: "WebController")
                as! BookTicketController
        WebController.url = URL(string: merchandiseJSON["queryresult"][sender.tag]["link"].stringValue)
        
        //        WebController.url = theUrl
        self.navigationController?.pushViewController(WebController, animated: true)

    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//         merchandiseIndex = indexPath.row
////        performSegue(withIdentifier: "merchandiseProducts", sender: indexPath.row)
//        let WebController =
//            self.storyboard?.instantiateViewController(withIdentifier: "WebController")
//                as! BookTicketController
//         WebController.url = URL(string: merchandiseJSON["queryresult"][indexPath.row]["link"].stringValue)
//       
////        WebController.url = theUrl
//        // pass the relevant data to the new sub-ViewController
//        // tell the new controller to present itself
//        self.navigationController?.pushViewController(WebController, animated: true)
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "merchandiseProducts" {
//            let WebController:BookTicketController = segue.destination as! BookTicketController
//            let theUrl = URL(string: merchandiseJSON["queryresult"][merchandiseIndex]["link"].stringValue)
//            WebController.url = theUrl
//        }
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
class merchandiseTable: UITableViewCell{
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var buyNow: UIButton!
   
    
}
