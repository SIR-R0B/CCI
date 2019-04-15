import Foundation



/*
 * Complete the 'slowestKey' function below.
 *
 * The function is expected to return a CHARACTER.
 * The function accepts 2D_INTEGER_ARRAY keyTimes as parameter.
 */

func slowestKey(keyTimes: [[Int]]) -> Character {
    // Write your code here
    let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    //print(alphabet[0])
    
    var timeStart = 0
    var maxTime = (0,"")

    for i in 0..<keyTimes.count{
        let time = keyTimes[i][1] - timeStart
        let character = alphabet[keyTimes[i][0]]
        if time > maxTime.0 {
            maxTime = (time, character)
        }
        timeStart = keyTimes[i][1]
    } 

    return Character(String(maxTime.1))
}

print(slowestKey(keyTimes: [[0,2],[1,3],[0,7]]))
