/* Simple Hello World in Node.js */
const vers = require('./version');

function getCurrentVersion(amiName,amiNameArray) {
    let numbers=amiNameArray.map(p => Number(p.replace(amiName, '').replace(/\./g, '')));
    latestVersion = (Math.max(...numbers)).toString();
    currentVersionName = amiNameArray.find(p=>p.replace(/\./g, '')===amiName+latestVersion)
    console.log('Current Version:', currentVersionName);
    return currentVersionName;
}

function doVersioning(currentAmiName, major_version, minor_version) {
    const versions_split = currentAmiName.split('.');
    const currentMinor=versions_split[1];
    const currentPatch=versions_split[2];
    const currentMajor=versions_split[0].split('_')[1].substr(1,versions_split[0].split('_')[1].length);
    let newAmiName="";
    // console.log(currentMajor,currentMinor,currentPatch);
    if (major_version===true && minor_version===true)
    {
        console.log("Both Major and Minor versioning is not possible!");
    }
    else if (major_version===true && minor_version===false)
    {
        newAmiName= versions_split[0].split('_')[0]+"_v"+(Number(currentMajor)+1).toString()+".0.0";
        // console.log('New Latest Version:', finalName);
    }
    else if (major_version===false && minor_version===true)
    {
        newAmiName= versions_split[0].split('_')[0]+"_v"+currentMajor+'.'+(Number(currentMinor)+1).toString()+".0";
        // console.log('New Latest Version:', finalName);
    }
    else
    {
        newAmiName= versions_split[0].split('_')[0]+"_v"+currentMajor+'.'+currentMinor+'.'+(Number(currentPatch)+1).toString();
        // console.log('New Latest Version:', finalName);
    }
    return newAmiName;
}

function main() {
    // const ec2 = new aws.EC2({apiVersion: '2016-11-15'});
    // let params = {
    //     Owners: [
    //         "178571981166"]
    // };
    // let data = [];
    // const result = await.ec2.describeImages(params).promise();
    
    // if (result && result.Images && result.Images.length > 0) {
    //     data = result.Images.map(p => p.Name);
    // }
    
    let newVersionName = '';
    const defaultName = "altaf" + "_v";
    const major_version = true;
    const minor_version = true;
    
    const data = ["altaf", "altaf_v1.0.0", "altaf_v1.0.1", "altaf_v9.9.9", "abc", "xyz"];
    
    if (data.length === 0) {
        newVersionName = defaultName + "1.0.0";
    } else {
        const amiNameMatchArray = data.filter(p => p.startsWith(defaultName));
        if (amiNameMatchArray.length === 0) {
            newVersionName = defaultName + "1.0.0";
        } else {
            currentVersionName = vers.getCurrentVersion(defaultName,amiNameMatchArray);
            newVersionName = vers.doVersioning(currentVersionName, major_version, minor_version);
        }
    }
    if (newVersionName!=='')
    {
    console.log('New Version:', newVersionName);
    }
}

main()




// const filtered = ["temp_v9.0.2", "temp_v1.0.1", "temp_v2.0.2", "temp_v9.9.9"];
// currentName = getcurrentversion(filtered);
// currentName = doversioning(currentName, major_version, minor_version);
// console.log(currentName)

// console.log(maxArrayName);
//const maxArraryName=tmpName + max[0] + '.' + max[1] + '.' + max[2];
// const maxArraryName="temp_v9.9.9"

// console.log('Current Latest Version:', maxArrayName)

/*
const versions = filtered.map(p => p.replace('temp_v', '').replace(/\./g, ''));
console.log(versions);
let latestVersion = parseInt(versions[0]);
console.log(versions[0]); 
for (let version of versions) {
            if (parseInt(version) > latestVersion) {
                latestVersion = parseInt(version);
            }
        }
console.log(latestVersion);
const tmpVersion = (parseInt(latestVersion)).toString();
if (major_version === true) {
    const major = (parseInt(tmpVersion[0]) + 1).toString();
    console.log(major);
    const revised = major + 0 + 0;
    console.log(revised);
    let newVersion = revised[0];
    console.log(newVersion);
    for (let i = 1; i < revised.length; i++) {
            newVersion = newVersion + '.' + revised[i];
        }
    console.log(newVersion);
    newName = tmpName + newVersion;
    console.log("New Version:", newName);
} else if (minor_version === true) {
    const minor = (parseInt(tmpVersion[1]) + 1).toString();
    console.log(minor);
    const revised = tmpVersion[0] + minor + 0;
    console.log(revised);
    let newVersion = revised[0];
    console.log(newVersion);
    for (let i = 1; i < revised.length; i++) {
            newVersion = newVersion + '.' + revised[i];
        }
    console.log(newVersion);
    newName = tmpName + newVersion;
    console.log("New Version:", newName);
    
} else {
    const patch = (parseInt(tmpVersion) + 1).toString();
    console.log(patch);
    let newVersion = patch[0];
    console.log(newVersion);
    for (let i = 1; i < patch.length; i++) {
            newVersion = newVersion + '.' + patch[i];
        }
    console.log(newVersion);
    
    newName = tmpName + newVersion;
    console.log("New Version:", newName);
}
*/
// const tmpVersion = (parseInt(latestVersion)).toString();
// let newVersion = tmpVersion[0];
// for (let i = 1; i < tmpVersion.length; i++) {
//     newVersion = newVersion + '.' + tmpVersion[i];
// }
// console.log(newVersion);  
// if (major_version === true) {
//     const major = newVersion.split('.')
//     console.log(major)
//     mj = (parseInt(major[0]) + 1).toString();
//     console.log(mj);
//     revised = mj + major[1] + major[2];
//     console.log(revised);
// }
      
