package
{

	import feathers.controls.Button;
	import feathers.themes.MetalWorksDesktopTheme;
	
	import starling.display.Sprite;

	public class Main extends Sprite
	{
		private var button:Button; 
		public function Main()
		{

			new MetalWorksDesktopTheme();
			button = new Button();
			button.label = "Test Button";
			addChild(button);
		}
	}
}