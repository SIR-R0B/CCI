// CCI 1.1 == implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

func isUnique(_ S: String) -> Bool {

var lows = Array(S.lowercased()).sorted()

for i in 0...lows.count-2{
    if lows[i] == lows[i+1]{
        return false
    }
}

return true

}

print(isUnique("Nose"))
print(isUnique("Grass"))