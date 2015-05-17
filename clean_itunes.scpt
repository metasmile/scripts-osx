JsOsaDAS1.001.00bplist00�Vscript_�var log = console.log

cleanTrackLists()

function cleanTrackLists(){
	iTunes = Application('iTunes')
	delay(.3)
	
	var cleancount = 0
	var albums = {}
	var files = {}
	iTunes.libraryPlaylists[0].fileTracks().forEach(function(t){
		if(t.podcast()){
			return;
		}
		
		//clean by file location
		var loc = t.location()
		var cleanByFile = !loc || (loc && files[loc])

		//clean byname by same album
		var an = t.album()
		var cleanByNameInAlbum = (albums[an] ? albums[an] : (albums[an]={}))[t.name()]
		
		if(cleanByFile || cleanByNameInAlbum){
			iTunes.delete(t)
			cleancount++
		}else{
			files[loc] = t
			albums[an][t.name()] = t
		}
	})
	return cleancount
}


                              � jscr  ��ޭ