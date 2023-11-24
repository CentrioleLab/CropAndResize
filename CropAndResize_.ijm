// Version 10th June 2020
// Set the correct scale of the new window

run("ROI Manager...");
dir=getDirectory("Choose a Directory to Save New Files");
waitForUser("Modify the size and position of the ROI for each image.\nOnce it's done, press OK");

nImg = nImages;
for (img=1; img<= nImg; img++) {
    selectImage(img);
    run("Crop");
    name=getTitle; 
    getDimensions(width, height, channels, slices, frames);
    run("Canvas Size...", "width=" + width*6 +" height=" + width*6 +" position=Center zero");
    run("Scale...", "x=6 y=6 z=1.0 interpolation=Bilinear average" );
    run("Set Scale...", "known=" + 1/6 +" pixel=1");
    tmp=replace(name, "/", "_");
    clean_name=replace(tmp, " ", "_");
    print(dir);
    print(dir+"cropped_" + clean_name + ".tif");
    save(dir+"cropped_" + clean_name + ".tif");
//    save(dir+i+".tif");
}
print("Done." );



