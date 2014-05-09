package display.ui.menus 
{
	import com.greensock.TweenMax;
	import display.Color;
	import display.ui.TextGroup;
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author ...
	 */
	public class OptionsMenu extends BaseMenu 
	{
		
		private var _menuItems:TextGroup;
		
		private var _bpmItem:FlxText;
		
		public function OptionsMenu()
		{
			super(true, Color.White.ARGBValue, 0.5);
		}
		
		override public function setUp():void
		{
			super.setUp();
			
			_menuItems = new TextGroup(3);
			
		}
		
		private function _hide():void
		{
			this.visible = false;
		}
		
		override public function update():void
		{
			if (this.visible == false)
			{
				return;
			}			
			super.update();			
			
			if (FlxG.keys.justReleased("TAB"))
			{
				TweenMax.to(this, 0.3, { alpha: 0.0, onComplete:_hide } );
				return;
			}
			else if (FlxG.keys.justReleased("UP"))
			{
				
			}
			else if (FlxG.keys.justReleased("LEFT"))
			{
				
			}
			else if (FlxG.keys.justReleased("RIGHT"))
			{
				
			}
			else if (FlxG.keys.justReleased("TAB"))
			{
			}
		}
		
	}

}