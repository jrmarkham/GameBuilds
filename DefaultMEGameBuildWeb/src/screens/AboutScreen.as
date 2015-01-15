package screens
{
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.ScrollContainer;
	import feathers.layout.VerticalLayout;
	
	import starling.textures.Texture;
	
	public class AboutScreen extends Screen
	{
		override protected function initialize():void {
			buildContainer();
			loadTitles();
		}
		
		override protected function draw():void {
			
			
			
			
	//		titleLoader.validate();
	//		titleLoader.width = actualWidth;
		}
		
		private function buildContainer():void {
/*			verticalLayout = new VerticalLayout();
			verticalLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			verticalLayout.gap = 25;
			
			scrollContainer = new ScrollContainer();
			scrollContainer.layout = verticalLayout;
			scrollContainer.width = this.stage.stageWidth;
			scrollContainer.height = this.stage.stageHeight;
			addChild(scrollContainer);*/
			
			
			var test:Label = new Label();
			test.text = "ABOUT TEXT.";
			test.x = test.y = 100;
			addChild(test);
		}
		
		private function loadTitles():void {
		/*	titleLoader = new ImageLoader();
			titleLoader.maintainAspectRatio = true;
			titleLoader.source = Texture.fromEmbeddedAsset(TitleImage);
			scrollContainer.addChild(titleLoader);
			
			subText = new Label();
			subText.text = "Quickly sketch out your ideas on the go.";
			scrollContainer.addChild(subText);	*/
		}
	}
}