package data 
{
	import flash.net.URLRequest;
    import flash.net.URLVariables;
    import flash.net.sendToURL; 
	import flash.net.URLRequestMethod; 
	import flash.net.URLLoader; 
	import flash.net.sendToURL; 
	import flash.events.Event; 
	
	/**
	 * ...
	 * @author Marko
	 */
	public class GameScore 
	{
		
	//	public var loadURL:String = ""; 
		private var configURL:String = "assets/config.xml";; 	
		private var sendURL:String = "http://localhost/SpaceShooter/SetScore"; 
		private var xmlData:XML; 
		
		
		public function GameScore() 
		{
			var loader:URLLoader = new URLLoader(new URLRequest(configURL)); 
			loader.addEventListener(Event.COMPLETE, onLoaderComplete); 
		}
		
	
		
		
		private function onLoaderComplete(e:Event):void 
		{
			xmlData = XML(e.target); 
		}
		
		
		public function getXMLData():XML
		{
			return xmlData; 
		}
		
		
		public function sendData():void 
		{
			var request:URLRequest = new URLRequest(sendURL);
			// Create some variables to send
			var variables:URLVariables = new URLVariables( );
			variables.score = Game.SCORE; 
			variables.playerguid = Game.PLAYER_GUID; 
			variables.spaceshooter = "a9dd4250-5b92-4697-8947-ab7cd79989d4"; 
			request.data = variables;
			
			// Configure the variables to be sent via HTTP POST
			request.method = URLRequestMethod.POST;
			
			sendToURL(request); 
		}
		
	}

}