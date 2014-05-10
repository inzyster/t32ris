package display.ui 
{
	import com.greensock.TweenMax;
	import org.flixel.FlxBasic;
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author ...
	 */
	public class TextGroup extends FlxGroup 
	{
		
		private var _useTweens:Boolean;
		
		private var _defaultColor:uint;
		private var _highlightedColor:uint;
		
		private var _selectedIndex:int;
		
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
			_deselectItemAtIndex(_selectedIndex);
			_selectItemAtIndex(index);
		}
		
		public function TextGroup(MaxSize:uint=0, useTweens:Boolean = false, defaultColor:uint = 0xaaaaaa, highlightedColor:uint = 0xffffff) 
		{
			super(MaxSize);			
			_selectedIndex = -1;
			_defaultColor = defaultColor;
			_highlightedColor = highlightedColor;
			_useTweens = useTweens;
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
			var target:FlxText = (this.members[index] as FlxText);
			if (_useTweens == false)
			{
				target.color = _defaultColor;
			}
			else 
			{
				TweenMax.to(target, 0.2, { hexColors: { color:_defaultColor }} );
			}
		}
		
		private function _selectItemAtIndex(index:int):void
		{
			if (index < 0 || index >= this.members.length)
			{
				return;
			}
			var target:FlxText = (this.members[index] as FlxText);
			if (_useTweens == false)
			{
				target.color = _highlightedColor;
			}
			else 
			{
				TweenMax.to(target, 0.2, { hexColors: { color: _highlightedColor }} );
			}
			_selectedIndex = index;
		}
				
	}

}