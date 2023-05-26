//
//  GraphView.swift
//  OpenInAppProject
//
//  Created by Harshwardhan Sharma on 15/05/23.
//

import UIKit
import Charts

class GraphView: UIView, ChartViewDelegate {
    
    var lineChart = LineChartView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        lineChart.delegate = self
        settingUpChart()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        lineChart.delegate = self
        settingUpChart()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        settingUpChart()
        
    }
    
    func settingUpChart(){
        lineChart.frame = CGRect(x: 30, y: 0, width: self.frame.size.width - 50, height: 100)
        lineChart.center = self.center
        
        self.addSubview(lineChart)
            
        var entries = [ChartDataEntry]()
        for x in 0..<10{
//            z += z
//            y += y
            let y = x*2
            entries.append(ChartDataEntry(x: Double(x), y: Double(y)))
        }
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
        
        let viewFromXib = Bundle.main.loadNibNamed("Graph", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        viewFromXib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
        addSubview(viewFromXib)
        
        
    }
}
