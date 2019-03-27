/*
Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to O.
*/

func findzeros(_ m: [[Int]]) -> [[Int]]{

var mCopy = m

func delete(_ row: Int, _ col: Int) -> (){

    var i = 0

        while i <= mCopy[row].count-1{
            mCopy[row][i] = 0
            i += 1
        }

        i = 0

        while i <= mCopy.count-1{
            mCopy[i][col] = 0
            i += 1
        }

    }
//find the zeros first
    for i in 0...m.count-1{
        for j in 0...m[i].count-1{
            if m[i][j] == 0{
                //row is i, col is j
                //print("found: \(m[i][j]) row: \(i) and col: \(j)")
                delete(i,j)
            }
        }
    }

return mCopy
}

print(findzeros([[1,2,3,4,5,6], [7,8,0,9,10,11], [12,13,14,15,16,0]]))

// doesn't work for an mxn matrix, only a nxn square matrix