package objects 
{
	import starling.display.Sprite;
	import starling.text.TextField; 
	
	/**
	 * ...
	 * @author Marko
	 */
	public class Score extends Sprite 
	{
		
		private var score:TextField; 
		
		public function Score()
		{
			score = new TextField(300, 100, "0", "Arial", 32, 0XFFFFFF); 
			score.hAlign = "right"; 
			addChild(score); 
		}
		
		public function addScore(amt:Number):void 
		{
			var s:Number = parseInt(score.text); 
			var sum:Number = s + amt; 
			if (sum < 0) {
				sum = 0; 
			}			
			score.text = sum.toString(); 			
			Game.SCORE = sum; 
		}
		
	}

}