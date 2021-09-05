
def encrypt(str, n)
    if n <= 0 || str.nil? || str == ""
        return str
    end
    str2arr = str.split("")
    even = str2arr.values_at(* str2arr.each_index.select{|i| i.even?})
    odd = str2arr.values_at(* str2arr.each_index.select{|i| i.odd?})
    res = odd.join("") + even.join("")
    return encrypt(res, n-1).downcase
end

def decrypt(str, n)
    if n <= 0 || str.nil? || str == ""
        return str
    end
    str2arr = str.split("")
    lenS2a = str2arr.length
    res = []

    if lenS2a%2 == 0
        odd = str2arr[0, lenS2a/2]
        even = str2arr[lenS2a/2..-1]

        for i in 0..lenS2a/2 do
            res.push even[i]
            res.push odd[i]
        end
    else
        odd = str2arr[0, (lenS2a-1)/2]
        even = str2arr[(lenS2a-1)/2..-1]

        for i in 0..(lenS2a-1)/2-1 do
            res.push even[i]
            res.push odd[i]
        end
        res.push even[(lenS2a-1)/2]

    end
    return decrypt(res.join, n-1)
end

text = "Abcdefghij"
text = "bdfhjacegi"
text = "bdfhacegi"
text = "dhaeibfjcg"
n = 2

#r = encrypt(text, n)
#puts(r)

r = decrypt(text, n)
puts r
