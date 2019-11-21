 #@ File (label = "Input directory", style = "directory") input
 #@ File (label = "Output directory", style = "directory") output
 #@ String (label = "File suffix", value = ".tif") suffix

processFolder(input);


function processFolder(input) {

	setBatchMode(true);
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {

	run("Bio-Formats Windowless Importer", "open=[D:/Users/Taylor.Hietpas/Desktop/taylor/Data/20180430DMP 5-15-18 IFT20SkinLyve1488Prox1647/21666-3KOLyve1488+Prox1647.1.zstack1.oir]");
	suffix = ".tif";
	name = getTitle;
	stack = "stackNew";
	getDimensions(width, height, channelCount, sliceCount, frameCount);
	path = output + File.separator + stack + File.separator;
	File.makeDirectory(path);
	path = path + name;

}	
run("Bio-Formats Windowless Importer", "open=[D:/Users/Taylor.Hietpas/Desktop/taylor/Data/20180430DMP 5-15-18 IFT20SkinLyve1488Prox1647/21666-3KOLyve1488+Prox1647.1.zstack1.oir]");
run("Stack to RGB", "slices keep");
run("Split Channels");
close();

run("Merge Channels...", "c1=[21666-3KOLyve1488+Prox1647.1.zstack1-1.oir (red)] c2=[21666-3KOLyve1488+Prox1647.1.zstack1-1.oir (green)] c3=[21666-3KOLyve1488+Prox1647.1.zstack1-1.oir (blue)] create");
saveAs("Tiff", "D:/Users/Taylor.Hietpas/Desktop/taylor/Data/20180430DMP 5-15-18 IFT20SkinLyve1488Prox1647/Composite.tif");
close();
selectWindow("21666-3KOLyve1488+Prox1647.1.zstack1.oir");
close();
/*	getDimensions(width, height, channelCount, sliceCount, frameCount);
	print(channelCount);

	if(channelCount >= 2)
	{ 
		run("Split Channels", name);
		path = output + File.separator + "splitchannels" + File.separator;
		File.makeDirectory(path);

		for(i = 1; i<=channelCount; i++) 
		{
			name = getTitle;
			channel = "channel" + i;
			path = path + channel + File.separator;
			File.makeDirectory(path);
			path = path +name;
			saveAs("Tiff", path);

			channel = channel + "_MAX";
			path = output + File.separator + "splitchannels" + File.separator + channel + File.separator;
			File.makeDirectory(path);
			run("Z Project...", "projection=[Max Intensity]");
			name = getTitle;
			path = path + name;
			saveAs("Tiff", path);
			close();
		}
	}

	else
		print(name);
		if(sliceCount>1)
		{
			stack = "stackMax";
			run("Z Project", "projection=[Max Intensity]");
			path = output + File.separator + stack + File.separator;
			File.makeDirectory(path);
			name = getTitle;
			path = path + name;
			saveAs("Tiff", path);
		}
		else
		{
				path = output + File.separator + "noZstack" + File.separator;
				File.makeDirectory(path);
				name = getTitle;
				path = path + name;
				saveAs("Tiff", path);
		}
	}
	
}	
	/*for(i = 1; i<=channelCount; i++)
	{
		if(i == 0) printf("Error."); exit;
		else if(i == 1) channel = "red"; titleRed = name + " (" + channel + ")";
		else if(i == 2 ) channel = "green"; titleGreen =  name + " (" + channel + ")";
		else if(i == 3) channel = "blue"; titleBlue = name + " (" + channel + ")";
		else() channel = "alpha";

		window  = name + " (" + channel + ")";
		selectWindow(window);
		path = output + File.separator + "stack" + File.separator + channel + File.separator + name + suffix;
		saveAs("Tiff", path);		
		run("Z Project", "projection = [Max Intensity]");
		selectWindow("MAX_" + window);	
		path = output + File.separator + "MIP" + File.separator + channel + File.separator + name + suffix;
		saveAs("Tiff", path);		
	}

	if(channelCount == 1) titleGreen = "None"; titleBlue = "None"; titleAlpha = "None";
	else if(channelCount == 2 ) titleBlue = "None"; titleAlpha = "None";
	else if(i == 3) titleAlpha = "None";

	run("Merge Channels", "red = [" + titleRed + "] green = [" + titleGreen +"] blue = [" + titleBlue +"] alpha = [" titleAlpha + "]");
	path = output + File.separator + "stack" + File.separator + "Merge" + File.separator + name + suffix;
	saveAs("Tiff", path);
	path = output + File.separator + "MIP" + File.separator + "Merge" + File.separator + name + suffix;
	saveAs("Tiff", path);
	
}*/
