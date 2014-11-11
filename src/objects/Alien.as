package objects 
{
	import starling.display.MovieClip; 
	import starling.textures.Texture; 
	
	/**
	 * ...
	 * @author Marko
	 */
	public class Alien extends MovieClip
	{
		
		public var hasPooped:Boolean = false; 
		
		public function Alien() 
		{
			super(Assets.ta.getTextures("alien"), 12); 
			
			pivotX = width * 0.5; 
			pivotY = height * 0.5; 
			
		}
		
	}

}