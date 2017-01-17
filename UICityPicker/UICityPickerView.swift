//
//  UICityPickerView.swift
//  UICityPicker
//
//  Created by ding_qili on 16/11/25.
//  Copyright © 2016年 ding_qili. All rights reserved.
//

import UIKit

@objc
public protocol UICityPickerViewDelegate:NSObjectProtocol {
    func cityPickerView(uIPickerView:UIPickerView,didSelect province:String,city:String,district:String)
}

open class UICityPickerView: UIPickerView {
    fileprivate var provinceList:[String] = []
    fileprivate var cityDictionary:[String:[String]] = [:]
    fileprivate var districtDictionary:[String:[String]] = [:]
    
    fileprivate var stringOfProvince: String = "" {
        didSet{
            self.reloadComponent(1)
            self.selectRow(0, inComponent: 1, animated: true)
            self.stringOfCity = cityDictionary[stringOfProvince]?.first ?? ""
        }
    }
    fileprivate var stringOfCity: String = "" {
        didSet{
            self.reloadComponent(2)
            self.selectRow(0, inComponent: 2, animated: true)
            self.stringOfDistrict = districtDictionary[stringOfCity]?.first ?? "";
        }
    }
    fileprivate var stringOfDistrict: String = "" {
        didSet{
            didSelect()
        }
    }

    open weak var cityPickerDelegate:UICityPickerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.dataSource = self;
        self.delegate = self;
        
        let currBundle =  Bundle(for: UICityPickerView.self)
        guard let cityPlist =  currBundle.path(forResource: "City", ofType: "plist") else {
            return
        }
        guard let cityDictionary =  NSDictionary(contentsOfFile: cityPlist) else {
            return
        }
        guard let citys = cityDictionary.value(forKey: "Citys") as? Array<NSDictionary> else{
            return
        }
        
        citys.forEach { (cityInfoDictionary) in
            if let  _provinceName =  cityInfoDictionary.value(forKey: "name") as? String{
                self.provinceList.append(_provinceName)
                self.cityDictionary[_provinceName] = [];
                guard let _subCitys = cityInfoDictionary.value(forKey: "sub") as? Array<NSDictionary> else{
                    return
                }
                _subCitys.forEach({ (_subCitysInfo) in
                    guard let  _subCityName =  _subCitysInfo.value(forKey: "name") as? String else{
                        return
                    }
                    self.cityDictionary[_provinceName]?.append(_subCityName)
                    guard let  _subdistrict =  _subCitysInfo.value(forKey: "sub") as? Array<String> else{
                        return
                    }
                    self.districtDictionary[_subCityName] = _subdistrict;
                })
                
            }
        }
        self.stringOfProvince = self.provinceList.first ?? "";
        self.stringOfCity = self.cityDictionary[stringOfProvince]?.first ?? ""
        self.stringOfDistrict = self.districtDictionary[stringOfCity]?.first ?? "";
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func didSelect(){
        cityPickerDelegate?.cityPickerView(uIPickerView: self, didSelect: self.stringOfProvince, city: self.stringOfCity, district: self.stringOfDistrict);
    }
}

extension UICityPickerView:UIPickerViewDataSource {
    // returns the number of 'columns' to display.
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        switch component {
        case 0:
            return provinceList.count
        case 1:
            return cityDictionary[stringOfProvince]?.count ?? 0
        case 2:
            return districtDictionary[stringOfCity]?.count ?? 0
        default:
            return 0
        }
    }
}

extension UICityPickerView:UIPickerViewDelegate{
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return provinceList[row]
        case 1:
            return cityDictionary[stringOfProvince]?[row]
        case 2:
            return districtDictionary[stringOfCity]?[row]
        default:
            return nil
        }
    }
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        switch component {
        case 0:
            self.stringOfProvince = provinceList[row];
        case 1:
            self.stringOfCity = cityDictionary[stringOfProvince]?[row] ?? "";
        case 2:
            self.stringOfDistrict = districtDictionary[stringOfCity]?[row] ?? "";
        default:
            break
        }
        
    }
}
