package {

	import interfaces.IState;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import states.GameOver;
	import states.Menu;
	import states.Play;
	

	public class Game extends Sprite
	{
		public static const MENU_STATE:int = 0; 
		public static const PLAY_STATE:int = 1; 
		public static const GAME_OVER_STATE:int = 2; 
		
		private var current_state:IState; 
		
		
		public static const BULLET_SPEED:Number = 6; 
		public static const ALIEN_SPEED:Number = 5; 
		public static const POOP_SPEED:Number = 7; 
		
		public static var PLAYER_NAME:String = ""; 
		public static var PLAYER_GUID:String = ""; 
		public static var GAME_SESSION:String = ""; 
		public static var SCORE:Number = 0; 
		
		
		public function Game()
		{
			/*var textField:TextField = new TextField(400, 300, "Welcome to Starling!");
			addChild(textField);*/
			Assets.init(); 
			addEventListener(Event.ADDED_TO_STAGE, init); 
		}
		
		private function init(event:Event):void 
		{
			
			
			

			changeState(MENU_STATE); 
			addEventListener(Event.ENTER_FRAME, update); 
		}
		
		
		public function changeState(state:int):void 
		{
			
			if (current_state != null) {
				current_state.destroy(); 
				current_state = null; 
			}
			
			switch (state) 
			{
				case MENU_STATE:
					current_state = new Menu(this); 
				break;
				case PLAY_STATE:
					current_state = new Play(this); 
				break;
				case GAME_OVER_STATE:
					current_state = new GameOver(this); 
				break;				
			}
						
			addChild(Sprite(current_state)); 
		}
		
		private function update(event:Event):void 
		{
			current_state.update(); 
		}
		
		private function destroy(event:Event):void 
		{
			
		}
	}

}

