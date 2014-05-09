package display.ui 
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author ...
	 */
	public class TextGroup extends FlxGroup 
	{
		
		private var _defaultColor:uint;
		private var _highlightedColor:uint;
		
		private var _selectedIndex:int;
		private var _wrap:Boolean;
		
		public function get selectedIndex():int
		{
			return _selectedIndex;
		}
		
		public function set selectedIndex(index:int):void
		{
			if (_selectedIndex == index)
			{
				return;
			}
			_selectItemAtIndex(index);
		}
		
		public function TextGroup(MaxSize:uint=0, defaultColor:uint = 0xffaaaaaa, highlightedColor:uint = 0xffffffff, wrap:Boolean = false) 
		{
			super(MaxSize);			
			_selectedIndex = -1;
			_defaultColor = defaultColor;
			_highlightedColor = highlightedColor;
			_wrap = wrap;
		}
		
		override public function add(item:FlxBasic):FlxBasic
		{
			if (item is FlxText)
			{
				var newItem:FlxText = item as FlxText;
				newItem.color = _defaultColor;
				return super.add(newItem);
			}
			return null;
		}
		
		private function _deselectItemAtIndex(index:int):void
		{
			if (index < 0 || index >= this.members.length)
			{
				return;
			}
			(this.members[index] as FlxText).color = _defaultColor;
		}
		
		private function _selectItemAtIndex(index:int):void
		{
			if (index < 0 || index >= this.members.length)
			{
				return;
			}
			(this.members[index] as FlxText).color = _highlightedColor;
			_selectedIndex = index;
		}
				
	}

}