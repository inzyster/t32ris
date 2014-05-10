package display.ui.menus 
{
	import com.greensock.TweenMax;
	import data.Registry;
	import data.ScaleKey;
	import data.ScaleType;
	import display.Color;
	import display.ui.TextGroup;
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	import utils.Utils;
	/**
	 * ...
	 * @author ...
	 */
	public class OptionsMenu extends BaseMenu 
	{
		
		private var _menuItems:TextGroup;
		
		private var _bpmItem:FlxText;
		private var _keyItem:FlxText;
		private var _scaleTypeItem:FlxText;
		
		private var _scaleKeys:Vector.<ScaleKey>;
		private var _scaleTypes:Vector.<ScaleType>;
		
		public function OptionsMenu()
		{			
			super(true, Color.White.ARGBValue, 0.5);
			
			_scaleKeys = ScaleKey.getOptions();
			_scaleTypes = ScaleType.getOptions();
		}
		
		override public function setUp():void
		{
			super.setUp();
			
			_menuItems = new TextGroup(3, true);
			
			_bpmItem = new FlxText(-3, 0, FlxG.width + 3, "< " + Registry.BPM.toString() + " >", true);
			_bpmItem.setFormat("04B", 8, 0xffffff, "center");
			
			_keyItem = new FlxText( -3, 8, FlxG.width + 3, "< " + Registry.scale.key.description + " >", true);
			_keyItem.setFormat("04B", 8, 0xffffff, "center");
			
			_scaleTypeItem = new FlxText( -3, 16, FlxG.width + 3, "< " + Registry.scale.type.description + " >", true);
			_scaleTypeItem.setFormat("04B", 8, 0xffffff, "center");
			
			_menuItems.add(_bpmItem);
			_menuItems.add(_keyItem);
			_menuItems.add(_scaleTypeItem);
			
			this.add(_menuItems);
			
			_menuItems.selectedIndex = 0;
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
				_menuItems.selectedIndex = Utils.WrapInt(_menuItems.selectedIndex - 1, 0, _menuItems.length);
			}
			else if (FlxG.keys.justReleased("DOWN"))
			{
				_menuItems.selectedIndex = Utils.WrapInt(_menuItems.selectedIndex + 1, 0, _menuItems.length);
			}
			else if (FlxG.keys.justReleased("LEFT"))
			{
				_previousValue();
			}
			else if (FlxG.keys.justReleased("RIGHT"))
			{
				_nextValue();
			}
			else if (FlxG.keys.justReleased("TAB"))
			{
			}
		}
		
		private function _previousValue():void
		{
			if (_menuItems.selectedIndex == 0)
			{
				Registry.BPM = Utils.ClampInt(Registry.BPM - 1, 32, 400);				
			}
			else if (_menuItems.selectedIndex == 1)
			{
				var currentIndex:uint = Registry.scale.key.optionIndex;
				var newIndex:uint = Utils.ClampInt(currentIndex - 1, 0, _scaleKeys.length - 1);
				Registry.scale.key = _scaleKeys[newIndex];
			}
			else if (_menuItems.selectedIndex == 2)
			{
				var currentIndex:uint = Registry.scale.type.optionIndex;
				var newIndex:uint = Utils.ClampInt(currentIndex - 1, 0, _scaleTypes.length - 1);
				Registry.scale.type = _scaleTypes[newIndex];
			}						
			_redrawOptions();
		}
		
		private function _nextValue():void
		{
			if (_menuItems.selectedIndex == 0)
			{
				Registry.BPM = Utils.ClampInt(Registry.BPM + 1, 32, 400);				
			}
			else if (_menuItems.selectedIndex == 1)
			{
				var currentIndex:uint = Registry.scale.key.optionIndex;
				var newIndex:uint = Utils.ClampInt(currentIndex + 1, 0, _scaleKeys.length - 1);
				Registry.scale.key = _scaleKeys[newIndex];
			}
			else if (_menuItems.selectedIndex == 2)
			{
				var currentIndex:uint = Registry.scale.type.optionIndex;
				var newIndex:uint = Utils.ClampInt(currentIndex + 1, 0, _scaleTypes.length - 1);
				Registry.scale.type = _scaleTypes[newIndex];
			}			
			_redrawOptions();
		}
		
		private function _redrawOptions():void
		{
			_bpmItem.text = "< " + Registry.BPM.toString() + " >";
			_keyItem.text = "< " + Registry.scale.key.description + " >";
			_scaleTypeItem.text = "< " + Registry.scale.type.description + " >";
		}
		
	}

}