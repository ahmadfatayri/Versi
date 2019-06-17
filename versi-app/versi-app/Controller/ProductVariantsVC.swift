//
//  ProductVariantsVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/16/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class ProductVariantsVC: UIViewController {

    var product: Product?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productAvailability: UILabel!
    @IBOutlet weak var productShipping: UILabel!
    @IBOutlet weak var productQty: UILabel!
    @IBOutlet weak var stepperBtn: UIStepper!
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productImage.sd_setImage(with: URL(string: (product?.images?.first)!), placeholderImage: UIImage(named: "placeholder_image"))
        productTitle.text = product?.name
        productPrice.text = "$ \(product?.price ?? 150)"
        productAvailability.text = "\(product?.availability ?? 1) available"
        productShipping.text = "Shipping: US $\(product?.shipping ?? 10)"
        stepperBtn.maximumValue = Double(product?.availability ?? 1)
    }
    @IBAction func stepperBtnPressed(_ sender: Any) {
        productQty.text = "\(Int(stepperBtn.value))"
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addToCartBtnPressed(_ sender: Any) {
        CartService.instance.addData(product_id: self.product!.uid!, qty: "\(product!.availability ?? 1)", color: "red", size: "xl" ){ (success) in
            if success {
                self.navigationController?.popToRootViewController(animated: true)
            }
            else {
                
            }
        }
    }
}
