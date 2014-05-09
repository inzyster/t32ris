package display.ui.menus 
{
	import display.Color;
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxTileblock;
	import utils.Utils;
	/**
	 * ...
	 * @author ...
	 */
	public class BaseMenu extends FlxGroup
	{
		
		private var _drawBorders:Boolean;
		
		private var _borders:FlxGroup;
	
		private var _alpha:Number;
		
		private var _borderColor:uint;
		
		public function get alpha():Number 
		{
			return _alpha;
		}
			
		public function set alpha(newAlpha:Number):void
		{
			if (_alpha == newAlpha)
			{
				return;
			}
			_alpha = newAlpha;
			Utils.UpdateAlpha(this, _alpha);
		}
		
		public function BaseMenu(drawBorders:Boolean = true, borderColor:uint = 0xffffffff, alpha:Number = 1.0)
		{
			_drawBorders = drawBorders;
			_alpha = alpha;
			_borderColor = borderColor;
		}
		
		public function setUp():void
		{
			
			var background:FlxTileblock = new FlxTileblock(0, 0, FlxG.width, FlxG.height);
			background.makeGraphic(background.width, background.height, Color.Black.ARGBValue);
			background.alpha = _alpha;
			this.add(background);
			
			if (_drawBorders)
			{
				_borders = new FlxGroup(4);
				
				var topBorder:FlxTileblock = new FlxTileblock(0, 0, FlxG.width, 1);
				topBorder.makeGraphic(topBorder.width, topBorder.height, _borderColor);
				topBorder.alpha = _alpha;
				_borders.add(topBorder);
				
				var bottomBorder:FlxTileblock = new FlxTileblock(0, FlxG.height - 1, FlxG.width, 1);
				bottomBorder.makeGraphic(bottomBorder.width, bottomBorder.height, _borderColor);
				bottomBorder.alpha = _alpha;
				_borders.add(bottomBorder);
				
				var leftBorder:FlxTileblock = new FlxTileblock(0, 1, 1, FlxG.height - 2);
				leftBorder.makeGraphic(leftBorder.width, leftBorder.height, _borderColor);
				leftBorder.alpha = _alpha;
				_borders.add(leftBorder);
				
				var rightBorder:FlxTileblock = new FlxTileblock(FlxG.width - 1, 1, 1, FlxG.height - 2);
				rightBorder.makeGraphic(rightBorder.width, rightBorder.height, _borderColor);
				rightBorder.alpha = _alpha;
				_borders.add(rightBorder);
				
				this.add(_borders);
			}
			
		}
		
		override public function update():void
		{
			if (this.visible == false)
			{
				return;
			}
			super.update();					
		}
		
	}

}