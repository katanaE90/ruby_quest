
def getFrqWords(text) 
    wordsStr = text.gsub(/,*\.*/, "").downcase
    wordsArr = wordsStr.split " "
    h = {}
    wordsArr.each {
        |v| 
        newV = v.strip.scan /^[a-z']+$/
        if !newV.empty? 
            h[newV] = h[newV].nil? ? 1 : h[newV] + 1
        end
    }

    hSorted = h.sort {|a, b| b[1] <=> a[1]}
    r = hSorted[0, 3].to_h.keys
    if hSorted[-3].nil? 
        return []
    end
    if hSorted[-3][1] != 1
        r = []
    end
    return r
end


text = "r4t r4t r4t r4t Though I've worked my way through many Rails books, this is the one that finally made me get it. Everything is done very much the Rails way — a way that felt very unnatural to me before, but now after doing this book finally feels natural. This is also the only Rails book that does test-driven development the entire time, an approach highly recommended by the experts but which has never been so clearly demonstrated before. Finally, by including Git, GitHub, and Heroku in the demo examples, the author really gives you a feel for what it's like to do a real-world project. The tutorial's code examples are not in isolation."
#text = "text text text text text1"
r = getFrqWords text
puts r
