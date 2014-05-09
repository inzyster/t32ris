package states
{

	import display.Color;
	import display.ui.menus.OptionsMenu;
	import org.flixel.*;
	import states.BaseState;

	public class PlayState extends BaseState
	{
		
		private var _options:OptionsMenu;
		
		public function PlayState()
		{
			super(false);
		}
		
		override public function create():void
		{
			super.create();
			
			_options = new OptionsMenu();
			_options.setUp();
			_options.visible = false;
			
			this.add(_options);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.TAB)
			{
				_options.visible = true;
			}
		}
	}
}

