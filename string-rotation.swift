/*
Assume you have a method isSubstring which checks if one word is a substring of another. Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring (e.g.,"waterbottle"is a rotation of"erbottlewat").
*/

func isRotation(_ s1: String, _ s2: String) -> Bool {

    func isSubstring(_ s1: String, _ s2: String) -> Bool{
        for character in s2{
            if s1.contains(character) == false{
                return false
            }
        }
        return true
    }

    if isSubstring(s1,s2) == true{

        if s1.count != s2.count{
            return false
        }

        //may be substring but may not be a rotation
        var string1 = s1
        var temp = ""

        for i in 1..<s1.count{
            let index = string1.index(string1.startIndex, offsetBy: i-1)
            temp = String(string1.dropFirst(i)+string1[...index])
            //print(temp)
            if temp == s2{
                return true
            }
        }        

        return false
    }else{
        //s2 can't be a rotation if not a substring of s1
        return false
    }

}

print(isRotation("waterbottle","cds")) //false
print(isRotation("waterbottle","water")) // false
print(isRotation("waterbottle","terbolttewa")) //false
print(isRotation("waterbottle","terbottlewa")) // true

