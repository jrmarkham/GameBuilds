package data
{
	public class GlobalData
	{
		
		private static const DISPLAY_WIDTH:int = 2048;
		private static const DISPLAY_HEIGHT:int = 1280;		
		private static var _GAME_WIDTH:Number;
		private static var _GAME_HEIGHT:Number;
		private static var _GAME_SCALE:Number;
		private static var _GAME_MODE:String;
		//// CORE 
		private static const GAME_ARCADE:String = "ga";		
		private static const GAME_CASUAL:String = "gc";
		
		public function GlobalData(){
		}
		
		public static function setGameStaging(sw:int, sh:int):void{
			/// CORE RATIOS 
			var divWidth:Number =  sw / DISPLAY_WIDTH;
			var revDivWidth:Number = DISPLAY_WIDTH / sw;
			var divHeight:Number = sh / DISPLAY_HEIGHT;
			var revDivHeight:Number = DISPLAY_HEIGHT / sh;
			
			if(divWidth > divHeight){
				GAME_SCALE = divWidth;
				GAME_WIDTH = DISPLAY_WIDTH;
				GAME_HEIGHT = sh * (revDivWidth); /// reverse of the other ratio	
				
				// adjust 
			}else{
				GAME_SCALE = divHeight;
				GAME_HEIGHT = DISPLAY_HEIGHT;
				GAME_WIDTH = sw * (revDivHeight) /// reverse of the other ratio		
			}
			
			return;
		}
		
		
		
		public static function get GAME_SCALE():Number
		{
			return _GAME_SCALE;
		}
		
		public static function set GAME_SCALE(value:Number):void
		{
			_GAME_SCALE = value;
		}
		
		public static function get GAME_WIDTH():int
		{
			return _GAME_WIDTH;
		}
		
		public static function set GAME_WIDTH(value:int):void
		{
			_GAME_WIDTH = value;
		}
		
		public static function get GAME_HEIGHT():int
		{
			return _GAME_HEIGHT;
		}
		
		public static function set GAME_HEIGHT(value:int):void
		{
			_GAME_HEIGHT = value;
		}
		
		
		public static function get GAME_MODE():String
		{
			return _GAME_MODE;
		}
		
		public static function set GAME_MODE(value:String):void
		{
			_GAME_MODE = value;
		}		
	}
}