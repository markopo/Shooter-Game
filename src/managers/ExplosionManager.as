package managers 
{
	import starling.events.Event;
	import states.Play;
	import objects.Explosion; 
	import starling.core.Starling; 
	/**
	 * ...
	 * @author Marko
	 */
	public class ExplosionManager 
	{
		
		private var play:Play; 
		private var pool:StarlingPool; 
		
		public function ExplosionManager(play:Play) 
		{
			this.play = play; 
			
			pool = new StarlingPool(Explosion, 15); 
			
		}
		
		
		public function spawn(x:int, y:int):void 
		{
			var ex:Explosion = pool.getSprite() as Explosion; 
			ex.emitterX = x; 
			ex.emitterY = y; 
			ex.start(0.1); 
			play.addChild(ex); 
			Starling.juggler.add(ex); 
			ex.addEventListener(Event.COMPLETE, onComplete); 
		}
		
		private function onComplete(event:Event):void 
		{
			var ex:Explosion = event.target as Explosion; 
			Starling.juggler.remove(ex); 
			
			if (pool != null) {
				pool.returnSprite(ex); 
			}
			
		}
		
		
		public function destroy():void {
			
			for (var i:int = 0; i < pool.pool.length; i++) {
				var ex:Explosion = pool.pool[i]; 
				ex.dispose(); 
				ex = null; 
			}
			pool.destroy(); 
			pool = null; 
		}
	}

}