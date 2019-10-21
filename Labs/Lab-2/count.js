function countNumb(){
    var result = (db.phones.aggregate([
        {
            $group: {_id:"$components.prefix", total:{$sum:1}}
        }
    ]))

    result.forEach(element => {
        printjson(element)
    });
}

countNumb()