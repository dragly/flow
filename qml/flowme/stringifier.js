function stringifyProperties(object, properties, tabLevel) {
    if(!tabLevel) {
        tabLevel = 0;
    }

    var data = "";
    for(var i in object) {
        var index = properties.indexOf(i);
        if(index !== -1) {
            for(var j = 0; j < tabLevel; j++) {
                data += "    ";
            }
            data += i + ": " + object[i] + ";\n"
        }
    }
    return data;
}
