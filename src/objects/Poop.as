package objects 
{
	import starling.display.Sprite; 
	import starling.display.Image;
	/**
	 * ...
	 * @author ...
	 */
	public class Poop extends Sprite 
	{
	    public var xD:Number = 0;  
			
			
		public function Poop() 
		{
			var img:Image = new Image(Assets.ta.getTexture("poop")); 
			pivotX = img.width * 0.5; 
			pivotY = img.height * 0.5; 
			addChild(img); 
		}
		
	}

}