package objects 
{
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture; 
	
	/**
	 * ...
	 * @author Marko
	 */
	public class Explosion extends PDParticleSystem 
	{
		
		public function Explosion() 
		{
			super(XML(new Assets.explosionXML()), Assets.ta.getTexture("explosion")); 
		}
		
	}

}