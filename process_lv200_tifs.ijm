// creates composite from tif stack in wrong order and optionally sets LUTs 
//should work for multi-channel images of 2-4 channels

// Parameters to set 
newnam =getTitle();

//dialog to get number of channels
Dialog.create("Get no. of channels");
Dialog.addNumber("Number of channels (min 2, max 4): ", 3);
Dialog.show();
//get dialog input
c = Dialog.getNumber();

coloring = 1 // 1 if luts should be set 
cols = newArray( "Magenta", "Red","Green","Grays");

rename("temp");
run("Deinterleave", "how="+c);
if(c == 4){
run("Merge Channels...", "c1=[temp #1] c2=[temp #2] c3=[temp #3] c4=[temp #4] create");
}
if(c == 3){
run("Merge Channels...", "c1=[temp #1] c2=[temp #2] c3=[temp #3] create");
}
if(c == 2){
run("Merge Channels...", "c1=[temp #1] c2=[temp #2]  create");
}
run("Grays");
selectWindow("Composite");
rename(newnam);
//f = nSlices/c;
//run("Properties...", "slices=1 frames="+f);

run("Channels Tool...");
Property.set("CompositeProjection", "null");
Stack.setDisplayMode("color");

if(coloring == 1){
	for (j=0; j<c;j+=1) {
		Stack.setChannel(j+1);
		run(cols[j]);
	}
}