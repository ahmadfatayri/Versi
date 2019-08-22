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
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var colorLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var addToCartBtn: borderButton!
    @IBOutlet weak var colorValueLbl: UILabel!
    @IBOutlet weak var sizeValueLbl: UILabel!
    
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
        titleLbl.text = self.getByTagName(key: "productOptionLbl")
        colorLbl.text = self.getByTagName(key: "colorLbl")
        sizeLbl.text = self.getByTagName(key: "sizeLbl")
        qtyLbl.text = self.getByTagName(key: "qtyLbl")
        descriptionLbl.text = self.getByTagName(key: "descriptionShippingLbl")
        addToCartBtn.setTitle(self.getByTagName(key: "addtocart"), for: .normal)
        sizeValueLbl.text = product?.sizes![0]
        colorValueLbl.text = Array((self.product?.colors!.keys)!)[0]
        
        colorCollectionView.tag = 12
        sizeCollectionView.tag = 13
        
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        var layout = colorCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumLineSpacing = 0
        layout?.minimumInteritemSpacing = 0
        
        sizeCollectionView.delegate = self
        sizeCollectionView.dataSource = self
        layout = sizeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumLineSpacing = 0
        layout?.minimumInteritemSpacing = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    @IBAction func stepperBtnPressed(_ sender: Any) {
        productQty.text = "\(Int(stepperBtn.value))"
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addToCartBtnPressed(_ sender: Any) {
        CartService.instance.addData(product_id: self.product!.uid!, qty: productQty.text!, color: colorValueLbl.text!, size: sizeValueLbl.text!){ (success) in
            if success {
                self.navigationController?.popToRootViewController(animated: true)
            }
            else {
                
            }
        }
    }
}

extension ProductVariantsVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 12 {
            return (self.product?.colors?.count)!
        }
        else {
            return (self.product?.sizes?.count)!
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 12 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionCell", for: indexPath) as! ColorCollectionCell
            
            let layer = cell.layer
            layer.cornerRadius = 4.0
            layer.borderColor = UIColor(white: 0.8, alpha: 1).cgColor
            layer.borderWidth = 1.0
//            Array((self.product?.colors!.keys)!)[0]
//            Array((self.product?.colors!.values)!)[0]
            cell.backgroundColor = UIColor(hexString: Array((self.product?.colors!.values)!)[indexPath.row])
//            if cell.isSelected {
//
//            }else {
//
//            }
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCollectionCell", for: indexPath) as! SizeCollectionCell
            cell.config(sizeLbl: (self.product?.sizes![indexPath.row])!)
            
            let layer = cell.layer
            layer.cornerRadius = 4.0
            layer.borderColor = UIColor(white: 0.8, alpha: 1).cgColor
            layer.borderWidth = 1.0
          
            return cell
        }
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 50.0, height: 50.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.blue.cgColor
        cell?.layer.borderWidth = 1
        cell?.isSelected = true
        if collectionView.tag == 13 {
            self.sizeValueLbl.text = product?.sizes![indexPath.row]
        }
        else {
            self.colorValueLbl.text = Array((self.product?.colors!.keys)!)[indexPath.row]
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor(white: 0.8, alpha: 1).cgColor
        cell?.layer.borderWidth = 1
        cell?.isSelected = true
    }
}


