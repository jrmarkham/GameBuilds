package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	
	import starling.core.Starling;
	
	import data.GlobalData;

	public class Start extends Sprite{
		
		
		
		
		
		private var starling:Starling;
		public function Start()
		{
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			loaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
		}
		
		private function onLoadComplete(e:Event):void {
			/// get adjusted size for game screen width and height aren't exact/// 
			GlobalData.setGameStaging(stage.stageWidth, stage.stageHeight);
			Starling.handleLostContext = true;
			starling = new Starling(Main, stage);
			starling.start();
			
			/// EVENT LISTENERS FOR MOBILE NVIRONEMNTE RESIZE AND 
			stage.addEventListener(Event.RESIZE, onStageResize);
			stage.addEventListener(Event.DEACTIVATE, onStageDeactivate);
			return;
		}
		
		
		
		private function onStageResize(e:Event):void {
			GlobalData.setGameStaging(stage.stageWidth, stage.stageHeight);
			
			starling.stage.stageWidth = stage.stageWidth;
			starling.stage.stageHeight = stage.stageHeight;
			const viewPort:Rectangle = starling.viewPort;
			viewPort.width = stage.stageWidth;
			viewPort.height = stage.stageHeight;
			starling.viewPort = viewPort;
			return;
		}
		
		
		
		private function onStageDeactivate(e:Event):void {
			starling.stop();
			stage.addEventListener(Event.ACTIVATE, onStageActivate, false, 0, true);
			return;
		}
		
		private function onStageActivate(e:Event):void {
			stage.removeEventListener(Event.ACTIVATE, onStageActivate);
			starling.start();
			return;
		}
		
	}
}