package states 
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import interfaces.IState; 
	import managers.AlienManager;
	import managers.BulletManager;
	import managers.CollisionManager;
	import managers.ExplosionManager;
	import managers.PoopManager;
	import objects.Background;
	import objects.Hero;
	import objects.Score;
	import starling.display.Sprite; 
	import starling.events.Event; 
	import starling.core.Starling; 
	/**
	 * ...
	 * @author Marko
	 */
	public class Play extends Sprite implements IState 
	{
		public var game:Game; 
		private var background:Background; 
		public var hero:Hero;
		public var bulletManager:BulletManager; 
		public var alienManager:AlienManager; 
		public var collisionManager:CollisionManager; 
		public var explosionManager:ExplosionManager; 
		public var poopManager:PoopManager; 
		public var score:Score; 
		
		public var fire:Boolean = false; 
		private var ns:Stage; 
		
		public function Play(game:Game) 
		{
			this.game = game; 
			addEventListener(Event.ADDED_TO_STAGE, init); 
		}
		
		
		private function init(event:Event):void 
		{
			ns = Starling.current.nativeStage; 
			
			background = new Background(); 
			addChild(background); 
			
			hero = new Hero(this); 
			addChild(hero); 
			
			bulletManager = new BulletManager(this); 
			alienManager = new AlienManager(this); 
			collisionManager = new CollisionManager(this); 
			explosionManager = new ExplosionManager(this); 
			poopManager = new PoopManager(this); 
			
			score = new Score(); 
			score.x = 475; 
			score.y = 5; 
			addChild(score); 
			
			
			ns.addEventListener(MouseEvent.MOUSE_DOWN, onDown); 
			ns.addEventListener(MouseEvent.MOUSE_UP, onUp); 
			
		}
		
		
		private function onDown(event:MouseEvent):void 
		{
			fire = true; 
		}
		
		private function onUp(event:MouseEvent):void 
		{
			fire = false; 
			bulletManager.count = 0; 
		}
		
		
		public function update():void 
		{
			background.update(); 
			hero.update(); 
			bulletManager.update(); 
			alienManager.update(); 
			collisionManager.update(); 
			poopManager.update(); 
		}
		
		public function destroy():void 
		{
			ns.removeEventListener(MouseEvent.MOUSE_DOWN, onDown); 
			ns.removeEventListener(MouseEvent.MOUSE_UP, onUp); 
			bulletManager.destroy(); 
			alienManager.destroy(); 
			removeFromParent(true); 
		}
		
		
	}

}