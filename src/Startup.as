package {

import flash.display.Sprite;
import starling.core.Starling;

import flash.events.Event; 

import flash.net.URLRequest; 
import flash.net.URLRequestMethod; 
import flash.net.URLLoader; 


// http://gamua.com/starling/first-steps/#

	[SWF(width=800, height=800, frameRate=60, backgroundColor=0x000000)]
	public class Startup extends Sprite
	{
		private var _starling:Starling;
		
		private var loader:URLLoader; 
		private var userURL:String = "http://localhost/SpaceShooter/getUser"; 

		public function Startup()
		{
			
			try {
				var request:URLRequest = new URLRequest(userURL);				
				request.method = URLRequestMethod.GET; 
				loader = new URLLoader(); 
				loader.load(request);
				loader.addEventListener(Event.COMPLETE, loaderCompleted); 
			}
			catch (error:Error)
			{
				// trace(error.message); 
			}
			
			_starling = new Starling(Game, stage);
			_starling.start();
		}
		
		
		private function loaderCompleted(e:Event):void 
		{
				var data:Object = JSON.parse(loader.data); 
				Game.PLAYER_GUID = data.userguid; 
				Game.PLAYER_NAME = data.name; 
				Game.GAME_SESSION = data.gamesession; 			
		}
	}


}