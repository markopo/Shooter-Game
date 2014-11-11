package states 
{
	import data.GameScore;
	import interfaces.IState; 
	import objects.Background;
	import starling.display.Button;
	import starling.display.Sprite; 
	import starling.events.Event; 
	import starling.text.TextField; 
	
	import flash.net.URLRequest; 
	import flash.net.URLRequestMethod; 
	import flash.net.URLLoader; 
	
	/**
	 * ...
	 * @author Marko
	 */
	public class GameOver extends Sprite implements IState 
	{
		private var game:Game; 
		
		private var background:Background; 
		private var overText:TextField; 
		private var scoreText:TextField; 
		private var tryAgain:Button; 
	/*	
		private var loader:URLLoader; 
		private var userURL:String = "http://localhost:65361/SpaceShooter/getUser"; 
*/
		
		
		
		
		public function GameOver(game:Game) 
		{
			this.game = game; 
			
			/*var request:URLRequest = new URLRequest(userURL);			
			request.requestHeaders = new Array("application/json"); 
			request.method = URLRequestMethod.GET; 
			loader = new URLLoader(); 
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, loaderCompleted);
			*/
			
			var gameScore:GameScore = new GameScore(); 
			gameScore.sendData(); 
			
			addEventListener(Event.ADDED_TO_STAGE, init); 
		}
		
		
		private function init(event:Event):void 
		{
			background = new Background(); 
			addChild(background); 
			
			overText = new TextField(800, 200, "GAME OVER", "Verdana", 72, 0xFF0000, true); 
			overText.hAlign = "center"; 
			overText.y = 200; 
			addChild(overText); 
			
			tryAgain = new Button(Assets.ta.getTexture("tryAgainButton")); 
			tryAgain.addEventListener(Event.TRIGGERED, onAgain); 
			tryAgain.pivotX = tryAgain.width * 0.5; 
			tryAgain.y = 450; 
			tryAgain.x = 400; 
			addChild(tryAgain); 
			
			var tS:String = "You received: " + Game.SCORE.toString() + " points.";  
			scoreText = new TextField(800, 100, tS, "Verdana", 32, 0x0000FF, true); 
			scoreText.hAlign = "center"; 
			scoreText.y = 500; 
			addChild(scoreText); 
			
		}
		
		
		/*private function loaderCompleted(e:Event):void 
		{
			var data:Object = JSON.parse(loader.data); 
			// TODO	
				
		}*/
		
		private function onAgain(event:Event):void 
		{
			tryAgain.removeEventListener(Event.TRIGGERED, onAgain); 
			game.changeState(Game.PLAY_STATE); 
		}
		
		
		public function update():void 
		{
			background.update(); 
		}
		
		public function destroy():void 
		{
			
		}
		
		
	}

}