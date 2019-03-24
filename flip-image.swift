/*Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
*/

func rotate(_ a: [[Int]]) -> [[Int]] {
var row = [Int]()
var result = [[Int]]()
    for i in 0...a.count-1{
        row = []
        for j in 0...a[i].count-1{
            row.append(a[j][i])
        }
        result.append(Array(row.reversed()))
    }
return result
}

print(rotate([[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]]))