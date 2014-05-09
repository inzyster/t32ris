package states  
{
	import data.Fonts;
	import flash.system.System;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxState;
	import org.flixel.FlxTileblock;
	
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class BaseState extends FlxState 
	{

		private var _walls:FlxGroup;				
		private var _useWalls:Boolean;
		
		public function BaseState(useWalls:Boolean = true)
		{
			_useWalls = useWalls;
		}
		
		override public function create():void
		{
			super.create();
			
			new Fonts();
			
			if (_useWalls)
			{
			
				_walls = new FlxGroup(4);
				
				var wallColor:uint = 0xffffffff;
				
				var topWall:FlxTileblock = new FlxTileblock(0, 0, FlxG.width, 1);
				topWall.makeGraphic(topWall.width, topWall.height, wallColor);
				
				var bottomWall:FlxTileblock = new FlxTileblock(0, FlxG.height - 1, FlxG.width, 1);
				bottomWall.makeGraphic(bottomWall.width, bottomWall.height, wallColor);
				
				var leftWall:FlxTileblock = new FlxTileblock(0, 1, 1, FlxG.height - 2);
				leftWall.makeGraphic(leftWall.width, leftWall.height, wallColor);
				
				var rightWall:FlxTileblock = new FlxTileblock(FlxG.width - 1, 1, 1, FlxG.height - 2);
				rightWall.makeGraphic(rightWall.width, rightWall.height, wallColor);
				
				_walls.add(topWall);
				_walls.add(bottomWall);
				_walls.add(leftWall);
				_walls.add(rightWall);
				
				this.add(_walls);
			}
		}

		override public function update():void
		{
			super.update();
			
			if (CONFIG::debug == true)
			{
				if (FlxG.keys.ESCAPE)
				{
					System.exit(0);
				}
			}
			
		}
		
		public function collideWithWalls(target:FlxObject):void
		{
			if (_walls != null)
			{
				FlxG.collide(target, _walls);
			}
		}		
		
	}

}