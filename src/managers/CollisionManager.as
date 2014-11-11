package managers 
{
	import adobe.utils.ProductManager;
	import flash.geom.Point;
	import objects.Alien;
	import objects.Bullet;
	import objects.Poop;
	import states.Play;
	/**
	 * ...
	 * @author Marko
	 */
	public class CollisionManager 
	{
		
		private var play:Play; 
		private var p1:Point = new Point(); 
		private var p2:Point = new Point(); 
		
		public function CollisionManager(play:Play) 
		{
			this.play = play; 
			
			
		}
		
		public function update():void 
		{
			bulletsAndAliens(); 
			heroAndAliens(); 
			heroAndPoops(); 	
		//	poopAndBullets(); 
		}
		
		private function heroAndAliens():void 
		{ 
			var aa:Array = play.alienManager.aliens; 
			var a:Alien; 
			
			for (var i:int = aa.length - 1; i >= 0; i--) {
				a = aa[i]; 
				p1.x = play.hero.x; 
				p1.y = play.hero.y; 
				p2.x = a.x; 
				p2.y = a.y; 
				if (Point.distance(p1, p2) < a.pivotY + play.hero.pivotY) {
						play.game.changeState(Game.GAME_OVER_STATE); 
				}
			
			}
			
		}
		
		private function bulletsAndAliens():void 
		{
			var ba:Array = play.bulletManager.bullets; 
			var aa:Array = play.alienManager.aliens; 
			
			var b:Bullet; 
			var a:Alien; 
			
			for (var i:int = ba.length - 1; i >= 0; i--) {
				b = ba[i]; 
				for (var j:int = aa.length - 1; j >= 0; j--) {
					a = aa[j]; 
					p1.x = b.x; 
					p1.y = b.y; 
					p2.x = a.x; 
					p2.y = a.y; 
					
					if (Point.distance(p1, p2) < a.pivotY + b.pivotY) {
						Assets.explosion.play(); 
						play.explosionManager.spawn(a.x, a.y);
						play.alienManager.destroyAlien(a); 
						play.bulletManager.destroyBullet(b); 
						play.score.addScore(200); 
					}
					
					
					
				}
			}
		}
		
		
		private function heroAndPoops():void 
		{
			var pa:Array = play.poopManager.poops;  
			var p:Poop; 
			
			for (var i:int = pa.length - 1; i >= 0; i--) {
				p = pa[i]; 
				p1.x = play.hero.x; 
				p1.y = play.hero.y; 
				p2.x = p.x; 
				p2.y = p.y; 
				if (Point.distance(p1, p2) < p.pivotY + play.hero.pivotY) {
					//	play.game.changeState(Game.GAME_OVER_STATE); 
					play.poopManager.destroyPoop(p); 
					play.score.addScore(-500);
				}
			
			}
		}
		
		
		
		private function poopAndBullets():void 
		{
		/*    var ba:Array = play.bulletManager.bullets; 
			var pa:Array = play.poopManager.poops; 
			
			var b:Bullet; 
			var p:Poop; 
			
			for (var i:int = ba.length - 1; i >= 0; i--) {
				b = ba[i]; 
				for (var j:int = pa.length - 1; j >= 0; j--) {
					p = pa[j]; 
					p1.x = b.x; 
					p1.y = b.y; 
					p2.x = p.x; 
					p2.y = p.y; 
					
					if (Point.distance(p1, p2) < p.pivotY + b.pivotY) {
						Assets.explosion.play(); 
						play.explosionManager.spawn(p.x, p.y);
						play.poopManager.destroyPoop(p); 
						play.bulletManager.destroyBullet(b); 
						play.score.addScore(-10); 
					}
				}
			}*/
		}
		
	}

}