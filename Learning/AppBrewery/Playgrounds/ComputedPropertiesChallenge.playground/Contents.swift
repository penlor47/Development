import Foundation

var width: Float = 1.5
var height: Float = 2.3
let bucketArea: Float = 1.5

var bucketsOfPaint: Int {
    get {
        let area = width * height
        return Int(ceil(area / bucketArea))
    }
    set {
        let areaCanCover = Float(newValue) * bucketArea
        print("\(bucketsOfPaint) buckets can cover an area of \(areaCanCover)sqm")
    }
}



