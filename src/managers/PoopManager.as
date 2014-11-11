package managers 
{
		import states.Play;
		import objects.Poop; 
		import starling.core.Starling;
	/**
	 * ...
	 * @author ...
	 */
	public class PoopManager 
	{
		private var play:Play; 
		public var poops:Array; 
		private var pool:StarlingPool; 
		public var count:int; 
		
		
		public function PoopManager(play:Play) 
		{
			this.play = play; 
			poops = new Array(); 
			pool = new StarlingPool(Poop, 100); 
			
		}
		
		public function poop(y:Number, x:Number):void 
		{
			var p:Poop = pool.getSprite() as Poop; 
			poops.push(p); 
			p.y = y + 10;  
			p.x = x; 
			play.addChild(p);  
		}
		
		
		public function update():void 
		{
				
			var p:Poop;  
			var len:int = poops.length; 
			for (var i:int = len - 1; i >= 0; i--) {
				p = poops[i]; 
				p.y += Game.POOP_SPEED;  
				
				
				if (p.xD == 0) {
					p.xD = p.x - play.hero.x; 
				}
			   
				if (p.xD > 0) {					 
					p.x -= Game.POOP_SPEED/5; 				
				}
				else {
					p.x += Game.POOP_SPEED/5; 					
				}
				
				if (p.y > 800) {
					destroyPoop(p); 
				}
			}
			
		}
		
		public function destroyPoop(p:Poop):void 
		{
			 var len:int = poops.length; 
			for (var i:int = 0; i < len; i++) {
				if (poops[i] == p) {
					p.xD = 0; 
					poops.splice(i, 1); 
					p.removeFromParent(true); 
					pool.returnSprite(p); 
				}
			}		
		}
		
		public function destroy():void 
		{
			pool.destroy(); 
			pool = null; 
			poops = null; 
		}
		
		
	}

}