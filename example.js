getAMINames = async function (ec2) {
    let params = {};
    result = await ec2.describeImages(params).catch(error => {
        console.log(error, error.stack);
        return null;
    });

    if (result && result.Images && result.Images.length > 0) {
        return result.Images.map(p => p.Name);
    }
    return [];
}

getVersionedName = function (name, data) {
    // const name = "temp";
    const tmpName = name + "_v";
    let newName = '';

    // return if no ami present
    if (data.length === 0) {
        newName = tmpName + "1.0.0";
        return newName;
    }

    // return if no ami with the supplied name present
    const filtered = data.filter(p => p.startsWith(tmpName));
    let newName = '';
    if (filtered.length === 0) {
        newName = tmpName + "1.0.0";
        return newName;
    }

    //find the latest version  ---  1.0.1 -> 101
    const versions = filtered.map(p => p.replace(tmpName, '').replace(/\./g, ''));
    let latestVersion = parseInt(versions[0]);
    for (let version of versions) {
        if (parseInt(version) > latestVersion) {
            latestVersion = parseInt(version);
        }
    }

    //build new version  ---  102 -> 1.0.2
    const tmpVersion = (parseInt(latestVersion) + 1).toString();
    let newVersion = tmpVersion[0];
    for (let i = 1; i < tmpVersion.length; i++) {
        newVersion = newVersion + '.' + tmpVersion[i];
    }

    newName = tmpName + newVersion;
    console.log(latestVersion, newName);
    return newName;
}

// const data = ["temp", "temp_v1.0.0", "temp_v1.0.1", "temp_v1.0.2", "abc", "xyz"];
const data = await this.getAMINames();

if (!data) {
    console.log("creation failure");
    return;
}

const nameWithVersion = this.getVersionedName(name, data);

console.log("new name with version");
console.log(data, nameWithVersion);

return event;




// getVersion = function(name){
//     const
// }

// const name = event.sourceImageAttrs.Name;
// const amiNames = await getAMIs(name);
// let version;
// const exists = amiNames.find(p => p === name);
// while (exists) {
//     if(arr.length > 1){
//         //version exists
//         version = arr[1];
//     }
// }
