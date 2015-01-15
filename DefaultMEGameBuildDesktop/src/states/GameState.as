package states
{
	import flash.display.Stage;
	
	import data.GlobalData;
	
	import feathers.controls.Label;
	
	import interfaces.IState;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	
	public class GameState extends Sprite implements IState{
		public var main:Main;
		private var ns:Stage;
	
		

		public function GameState(m:Main)
		{
			this.main = m;
		///	touchable = false;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event):void{
			this.scaleX = this.scaleY = GlobalData.GAME_SCALE;
			/// INIT POOL  //
			trace ("GAME STATE ");
			var test:Label = new Label();
			test.text = "GAME";
			test.x = test.y = 100;
			addChild(test);
			
			return;
		}
		
		public function update():void
		{
			//FROM MAIN GAME LOOPS
			return;
		}

		public function destroy():void{
			//TODO: implement function
			return;
		}
	}		
}