/*
One Away: There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.
EXAMPLE
pale, ple -> true 
pales, pale -> true 
pale, bale -> true 
pale, bake -> false
*/

func oneAway(_ S1: String, _ S2: String) -> Bool {

    if S1 == S2 { return true}

    let charCountDiff = (S1.count - S2.count,S2.count - S1.count)

    switch charCountDiff{
    
    case let (a,_) where abs(a) > 1 : 
        return false

    case let (a,_) where a == 0:
        //create a set and see how much different the chars are, fail if too much different
        let string1 = Set(S1)
        let string2 = Set(S2)
        if string1 == string2 {
          //cannot do swaps because this would be more than one operation
          return false
        }
        //can one char be replaced? if so, return true
        var count = 0
        for i in 0..<Array(S1).count{
            if Array(S1)[i] != Array(S2)[i]{
            count += 1
            if count > 1{
                return false
            }
            }
        }
        return true

    case let (a,b) where a < b:
    //look at the bigger string, go one by one and see if you remove that one character does it become equal to the other
       for i in 0..<Array(S2).count{
           var temp = Array(S2)
           temp.remove(at: i)
            if temp == Array(S1){
            return true
            }
            }
        return false

    case let (a,b) where a > b:
        for i in 0..<Array(S1).count{
           var temp = Array(S1)
           temp.remove(at: i)
            if temp == Array(S2){
            return true
            }
            }
        return false

    default: 
        return false

    }
} 

print(oneAway("pale","pale")) // true (0)
print(oneAway("paleobread","pale")) //false
print(oneAway("pale","paleobread")) //false
print(oneAway("pals","psla")) //false
print(oneAway("pals","pala")) //true
print(oneAway("pales","pale")) //true
print(oneAway("pale","bale")) //true
print(oneAway("pale","bake")) //true


