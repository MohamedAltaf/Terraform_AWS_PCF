let params = {};
let data = [];
const result = await ec2.describeImages(params).catch(error => {
    console.log(error, error.stack);
    console.log("creation failure");
    return event;
});

if (result && result.Images && result.Images.length > 0) {
    data = result.Images.map(p => p.Name);
}

// const name = "temp";
const tmpName = name + "_v";
let newName = '';

// return if no ami present
if (data.length === 0) {
    newName = tmpName + "1.0.0";
} else {
    // return if no ami with the supplied name present
    const filtered = data.filter(p => p.startsWith(tmpName));
    if (filtered.length === 0) {
        newName = tmpName + "1.0.0";
    } else {
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
    }
}

// const data = ["temp", "temp_v1.0.0", "temp_v1.0.1", "temp_v1.0.2", "abc", "xyz"];

console.log("new name with version");
console.log(data, newName);

return event; // to prevent registering
