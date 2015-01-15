package{


	
	import data.GlobalData;
	
	import interfaces.IState;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import states.GameState;
	import states.NonGameState;

	
	/*
		MAIN SCREEN (SIZING / OVERRIDES / SIZING ASSETS / LOAD ASSETES 
			menu
				-- GAME SCREENS game casual / game arcade
				-- SCREEN
				-- INRTO in (center)
				-- ABOUT SCREEN
				-- HELP SCREEN
				-- SCREEN login /reg -- un/pw/email/nick
		GAME LAYERS
	
	*/
	
	
	public class Main extends Sprite{
		public const GAME_STATE:String = "gs";
		public const NON_GAME_STATE:String = "ngs";

		private var currentState:IState;
		private var loopOnBool:Boolean = false;
		public function Main()
		{
			
			///ASSETS INITS 
			
		
			///// 
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{

			changeState(NON_GAME_STATE);
			addEventListener(Event.ENTER_FRAME, update);			
			/// 2 STATES
			//GAME STATE
			// NON GAME STATE FEATHER
			/// Create Nav system in non GAME// 
		}

		public function playGameMode(gm:String):void{
			GlobalData.GAME_MODE = gm;
			changeState(GAME_STATE);
			return;
		}		
		
		public function changeState(state:String):void{
			if(currentState != null)
			{
				currentState.destroy();
				currentState = null;
			}
				
			switch(state)
			{
				case GAME_STATE:
					currentState = new GameState(this);
					break;
				
				case NON_GAME_STATE:
					currentState = new NonGameState(this)
					break;
				
			}
			
			addChild(Sprite(currentState));			
		}
		
		
		public function toggleGameLoop(b:Boolean):void{
			loopOnBool = b;
			return;
		}
		
		private function update(e:Event):void{
			//	trace ("game loop");
			/// GAME LOOP NOT NEEDED IN NON GAME SATE 
			if(loopOnBool){
				currentState.update();
			}
			return;
		}
		
	}
}