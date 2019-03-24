//given the string input is only uppercase and lowercase letters a-z
//if the original is not longer than the compressed, return original

func compress(_ S: String) -> String{

    var result = [String]()

    for i in 0...Array(S).count-1{
        if i >= 1 && Array(S)[i-1] == Array(S)[i]{
            continue
        }
        
        var j = i
        var count = 0
              
        while j <= Array(S).count-1{
            if Array(S)[j] == Array(S)[i]{
            count += 1 //keep counting while looking ahead
            j += 1 //keep looking ahead
            } else{
                break
            }
        }      
        
         result.append("\(Array(S)[i])\(count)") 
    }

        

       let joinedResult = result.joined(separator: "")

       if joinedResult.count >= Array(S).count{
            return S
        }else{
            return joinedResult 
        }        
    }

print(compress("aabcccccaaa")) // -> a2b1c5a3
print(compress("aa"))
print(compress("dddddwwwwddddaaaaddddggggggggggggg"))