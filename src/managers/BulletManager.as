package managers 
{
	import objects.Bullet;
	import states.Play;
	/**
	 * ...	
	 * @author Marko
	 */
	public class BulletManager 
	{
		private var play:Play; 
		public var bullets:Array; 
		private var pool:StarlingPool; 
		public var count:int; 
		
		
		public function BulletManager(play:Play) 
		{
			this.play = play; 
			bullets = new Array(); 
			pool = new StarlingPool(Bullet, 100); 
		}
		
		public function update():void 
		{
			var b:Bullet; 
			var len:int = bullets.length; 
			for (var i:int = len - 1; i >= 0; i--) {
				b = bullets[i]; 
				var y:Number = Math.abs(b.y - play.hero.y); 
				b.y -= Game.BULLET_SPEED + (y * 0.03); 
				// ;  
				if (b.y < 0) {
					destroyBullet(b); 
				}
			}
			
			if (play.fire && count % 10 == 0) {
				fire(); 
			}
			
			count += 1; 
		}
		
		private function fire():void 
		{
			var b:Bullet = pool.getSprite() as Bullet; 
			play.addChild(b); 
			b.x = play.hero.x; 
			b.y = play.hero.y - 15; 
			bullets.push(b); 
			
		/*	b = pool.getSprite() as Bullet; 
			play.addChild(b); 
			b.x = play.hero.x + 10; 
			b.y = play.hero.y + 15; 
			bullets.push(b); */
			
			Assets.shoot.play(); 
			
		}			
		
		public function destroyBullet(b:Bullet):void 
		{
			var len:int = bullets.length; 
			for (var i:int = 0; i < len; i++) {
				if (bullets[i] == b) {
					bullets.splice(i, 1); 
					b.removeFromParent(true); 
					pool.returnSprite(b); 
				}
			}
		}
		
		public function destroy():void 
		{
			pool.destroy(); 
			pool = null; 
			bullets = null; 
		}
		
	}

}