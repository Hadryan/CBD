function palindrome(str) {
    var re = /[\W_]/g;
    var lowRegStr = str.toLowerCase().replace(re, '');
    var reverseStr = lowRegStr.split('').reverse().join(''); 
    return reverseStr === lowRegStr;
  }

function pattern(){
    var result = db.phones.find({},{"_id":"*" })

    var lista = []

    result.forEach(element => {
       lista.push(element._id.toString())
    });

    lista.forEach(element => {
        res = palindrome(element)
        if(res == true){
            print("O número: " + element + " é uma capicua.")
        }
    });

}

pattern()