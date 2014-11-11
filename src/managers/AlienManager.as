package managers 
{
	import objects.Alien;
	import objects.Bullet;
	import states.Play;
	import starling.core.Starling; 
	/**
	 * ...	
	 * @author Marko
	 */
	public class AlienManager 
	{
		private var play:Play; 
		public var aliens:Array; 
		private var pool:StarlingPool; 
		public var count:int; 
		
		
		public function AlienManager(play:Play) 
		{
			this.play = play; 
			aliens = new Array(); 
			pool = new StarlingPool(Alien, 20); 
		}
		
		public function update():void 
		{
			var r:Number = Math.random(); 
			if (r < 0.05) {
				spawn(); 
			}
						
			var a:Alien; 
			var len:int = aliens.length; 
			for (var i:int = len - 1; i >= 0; i--) {
				a = aliens[i]; 
				a.y += Game.ALIEN_SPEED;  
				if((play.hero.y - a.y) < 200 && (play.hero.x - a.x) < 200 && !a.hasPooped) {
					this.play.poopManager.poop(a.y, a.x); 
					a.hasPooped = true; 
				}
				else if ((play.hero.y - a.y) > 200 && (play.hero.x - a.x) > 200 && a.hasPooped) {
					a.hasPooped = true; 					
				}
				else if (a.y > 800) {
					a.hasPooped = false; 
					destroyAlien(a); 
				}
			}
			
	
		}
		
		private function spawn():void 
		{
			var a:Alien = pool.getSprite() as Alien; 
			Starling.juggler.add(a); 
			aliens.push(a); 
			a.y = -50; 
			a.x = Math.random() * 700 + 50;
			play.addChild(a); 
			

		}			
		
		public function destroyAlien(a:Alien):void 
		{
	        var len:int = aliens.length; 
			for (var i:int = 0; i < len; i++) {
				if (aliens[i] == a) {
					aliens.splice(i, 1); 
					Starling.juggler.remove(a); 
					a.removeFromParent(true); 
					pool.returnSprite(a); 
				}
			}
		}
		
		public function destroy():void 
		{
			pool.destroy(); 
			pool = null; 
			aliens = null; 
		}
		
	}

}