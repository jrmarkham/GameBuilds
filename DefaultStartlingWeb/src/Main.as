package
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.utils.Color;
	
	public class Main extends Sprite
	{
		public function Main()
		{
			trace ("RED QUAD COMING UP")
			var quad:Quad = new Quad(200, 200, Color.RED);
			quad.x = 100;
			quad.y = 150;
			addChild(quad);
		}
	}
}