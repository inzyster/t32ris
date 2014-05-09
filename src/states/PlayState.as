package states
{

	import com.greensock.TweenMax;
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
			
			var optionsVisible:Boolean = _options.visible;
			
			super.update();			

			if (FlxG.keys.justReleased("TAB") && optionsVisible == false)
			{
				_options.alpha = 0.0;
				_options.visible = true;				
				TweenMax.to(_options, 0.3, { alpha: 0.7 } );
			}					
			
			if (optionsVisible == true)
			{
				return;
			}			
			
		}
	}
}

