package objects 
{
	import starling.display.Sprite; 
	import starling.display.Image;
	/**
	 * ...
	 * @author Marko
	 */
	public class Bullet extends Sprite
	{
		
	
		
		public function Bullet() 
		{
			var img:Image = new Image(Assets.ta.getTexture("bullet")); 
			pivotX = img.width * 0.5; 
			pivotY = img.height * 0.5; 
			addChild(img); 
			
			
		}
		
	}

}