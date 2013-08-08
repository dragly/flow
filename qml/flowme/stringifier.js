function stringifyProperties(object, properties, isLevel) {
    var tabLevel = 0;
    if(isLevel) {
        tabLevel = 1;
    } else {
        tabLevel = 2;
    }

    var realProperties = [];
    var relativeProperties = [];
    for(var i in properties) {
        var propertyA = properties[i];
        if(propertyA.indexOf("|") !== -1) {
            relativeProperties.push(2);
            realProperties.push(propertyA.replace("|",""));
        } else if(propertyA.indexOf("!") !== -1) {
            relativeProperties.push(1);
            realProperties.push(propertyA.replace("!",""));
        } else {
            relativeProperties.push(false);
            realProperties.push(propertyA);
        }
    }

    var data = "";
    for(var i in object) {
        var index = realProperties.indexOf(i);
        if(index !== -1) {
            var relativeOrder = relativeProperties[index];
            var realValue = object[i];
            var propertyValue = "";
            if(relativeOrder > 0) {
                if(isLevel) {
                    realValue /=  object["width"];
                    propertyValue += "width * ";
                } else {
                    if(relativeOrder === 2) {
                        realValue /= (object.level["width"]*object.level["width"]);
                        propertyValue += "level.width * level.width * ";
                    } else {
                        realValue /=  object.level["width"];
                        propertyValue += "level.width * ";
                    }
                }
            }
            propertyValue += realValue;

            for(var j = 0; j < tabLevel; j++) {
                data += "    ";
            }
            data += i + ": " + propertyValue + ";\n"
        }
    }
    return data;
}
