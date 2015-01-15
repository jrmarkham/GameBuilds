package states
{

	
	/// SCREENS 
	import feathers.controls.ButtonGroup;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.TabBar;
	import feathers.data.ListCollection;
	import feathers.motion.transitions.ScreenFadeTransitionManager;
//	import feathers.themes.AeonDesktopTheme;
	
	import interfaces.IState;
	
	import screens.AboutScreen;
	import screens.HelpScreen;
	import screens.HighScoreScreen;
	import screens.HomeScreen;
	import screens.LoginRegScreen;
	

	import starling.display.Sprite;
	import starling.events.Event;
	import feathers.controls.ScreenNavigatorItem;
	
	public class NonGameState extends Sprite implements IState
	{
		public var main:Main;
		private var screenNavigator:ScreenNavigator;
		private var screenTransitionManager:ScreenFadeTransitionManager;
		private var navigationBarTop:TabBar;
		private var buttonGroupBottom:ButtonGroup;
		private var navHeight:int;
		/// NAV TOP NON GAME
		private static const HOME_SCREEN:String = "home";
		private static const LOGIN_REG_SCREEN:String = "lrs";
		private static const HELP_SCREEN:String = "hs";
		private static const HIGH_SCORE_SCREEN:String = "hss";		
		private static const ABOUT_SCREEN:String = "as";
		/// BOTTOM NAV GAME MODES
		private static const GAME_ARCADE:String = "ga";		
		private static const GAME_CASUAL:String = "gc";
		/// STARLING STATE THAT USES FEATHER FOR INTERFACE
		public function NonGameState(m:Main)
		{
			this.main = m;
			this.addEventListener(Event.ADDED_TO_STAGE, onStageReady);
		}
		

		private function onStageReady():void
		{
			
		//	new AeonDesktopTheme();
		//	new MetalWorksMobileTheme();
			buildLayout();
			setupScreens();
			completeLayout();
		}
		
		private function completeLayout():void
		{
			navigationBarTop.validate();
			buttonGroupBottom.validate();
			navHeight = Math.round(navigationBarTop.height);
			screenNavigator.y = navHeight;
			navHeight += Math.round(buttonGroupBottom.height);
			screenNavigator.width = stage.stageWidth;
			screenNavigator.height = stage.stageHeight-navHeight;
			addChild(screenNavigator);
			buttonGroupBottom.y = screenNavigator.y + screenNavigator.height;
		}
		
		private function buildLayout():void
		{
			
			/// NON GAME NAV 
			navigationBarTop = new TabBar();
			navigationBarTop.dataProvider = new ListCollection([
				{label:"Home", data:HOME_SCREEN},
				{label:"Login / Register", data:LOGIN_REG_SCREEN},
				{label:"High Score", data:HIGH_SCORE_SCREEN},
				{label:"Help", data:HELP_SCREEN},
				{label:"About", data:ABOUT_SCREEN}
			]);
			navigationBarTop.selectedIndex = 0;
			navigationBarTop.addEventListener(Event.CHANGE, navigationBarTopChanged);
			///navigationBarTop.width = stage.stageWidth * 0.5
			navigationBarTop.horizontalAlign = TabBar.HORIZONTAL_ALIGN_CENTER;
			addChild(navigationBarTop);
			
			
			///GAME NAV
			buttonGroupBottom = new ButtonGroup();
			buttonGroupBottom.dataProvider = new ListCollection([
				{label:"Play Casual", gameType:GAME_CASUAL},
				{label:"Play Arcade", gameType:GAME_ARCADE}
			]);
			buttonGroupBottom.addEventListener(Event.TRIGGERED, buttonGroupBottomTriggered);
			buttonGroupBottom.width = stage.stageWidth * 0.25;
			buttonGroupBottom.direction = ButtonGroup.DIRECTION_HORIZONTAL;
			buttonGroupBottom.gap = 5;
			buttonGroupBottom.horizontalAlign = ButtonGroup.HORIZONTAL_ALIGN_CENTER;
	
			addChild(buttonGroupBottom);
		}
		
		private function navigationBarTopChanged(event:Event):void
		{
			screenNavigator.showScreen(navigationBarTop.selectedItem.data);
		}


		private function buttonGroupBottomTriggered(event:Event):void{
			trace ("triggered = " + event.data.gameType);
			
			main.playGameMode( event.data.gameType);
			return;
		}		
		
		private function setupScreens():void
		{
			screenNavigator = new ScreenNavigator();
	/*		
			SCEENS FOR NON GAME ELEMENTS */
			
			
			screenNavigator.addScreen(HOME_SCREEN, new ScreenNavigatorItem(HomeScreen));
			screenNavigator.addScreen(LOGIN_REG_SCREEN, new ScreenNavigatorItem(LoginRegScreen));
			screenNavigator.addScreen(HELP_SCREEN, new ScreenNavigatorItem(HelpScreen));
			screenNavigator.addScreen(HIGH_SCORE_SCREEN, new ScreenNavigatorItem(HighScoreScreen));
			screenNavigator.addScreen(ABOUT_SCREEN, new ScreenNavigatorItem(AboutScreen));
			screenTransitionManager = new ScreenFadeTransitionManager(screenNavigator);

		}
		
		public function goBrowse():void {
			navigationBarTop.selectedIndex = 0;
		}		
		
		public function update():void
		{
			// THIS SHOULD DIO NOTHING 
			//TODO: implement function
		}
		
		public function destroy():void
		{
			//TODO: implement function
		}
	}
}